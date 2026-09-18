import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/campaign_filter_model.dart';
import '../data/repositories/campaign_repository.dart';
import 'campaign_event.dart';
import 'campaign_filter_helper.dart';
import 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final CampaignRepository _repository;

  CampaignBloc({CampaignRepository? repository})
      : _repository = repository ?? MockCampaignRepository(),
        super(const CampaignState()) {
    on<LoadCampaignsEvent>(_onLoadCampaigns);
    on<SelectCampaignEvent>((e, emit) => emit(state.copyWith(selectedCampaign: e.campaign)));
    on<SearchCampaignsEvent>(_onSearchCampaigns);
    on<ChangeStatusTabEvent>(_onChangeStatusTab);
    on<ApplyFilterEvent>(_onApplyFilter);
    on<ResetFilterEvent>(_onResetFilter);
    on<CreateCampaignEvent>(_onCreateCampaign);
    on<DeleteCampaignEvent>(_onDeleteCampaign);
  }

  Future<void> _onLoadCampaigns(LoadCampaignsEvent event, Emitter<CampaignState> emit) async {
    emit(state.copyWith(status: CampaignStatusState.loading));
    try {
      final all = await _repository.getCampaigns();
      final filtered = filterCampaigns(all, state.activeTab, state.filter);
      emit(state.copyWith(
        status: CampaignStatusState.loaded,
        allCampaigns: all,
        filteredCampaigns: filtered,
        selectedCampaign: all.isNotEmpty ? all.first : null,
      ));
    } catch (e) {
      emit(state.copyWith(status: CampaignStatusState.error, errorMessage: e.toString()));
    }
  }

  void _onSearchCampaigns(SearchCampaignsEvent event, Emitter<CampaignState> emit) {
    final newFilter = state.filter.copyWith(searchQuery: event.query);
    final filtered = filterCampaigns(state.allCampaigns, state.activeTab, newFilter);
    emit(state.copyWith(filter: newFilter, filteredCampaigns: filtered));
  }

  void _onChangeStatusTab(ChangeStatusTabEvent event, Emitter<CampaignState> emit) {
    final filtered = filterCampaigns(state.allCampaigns, event.tab, state.filter);
    emit(state.copyWith(activeTab: event.tab, filteredCampaigns: filtered));
  }

  Future<void> _onApplyFilter(ApplyFilterEvent event, Emitter<CampaignState> emit) async {
    final filtered = filterCampaigns(state.allCampaigns, state.activeTab, event.filter);
    emit(state.copyWith(filter: event.filter, filteredCampaigns: filtered));
  }

  void _onResetFilter(ResetFilterEvent event, Emitter<CampaignState> emit) {
    const defaultFilter = CampaignFilterModel.initial;
    final filtered = filterCampaigns(state.allCampaigns, state.activeTab, defaultFilter);
    emit(state.copyWith(filter: defaultFilter, filteredCampaigns: filtered));
  }

  Future<void> _onCreateCampaign(CreateCampaignEvent event, Emitter<CampaignState> emit) async {
    await _repository.createCampaign(event.campaign);
    add(const LoadCampaignsEvent());
  }

  Future<void> _onDeleteCampaign(DeleteCampaignEvent event, Emitter<CampaignState> emit) async {
    await _repository.deleteCampaign(event.campaignId);
    add(const LoadCampaignsEvent());
  }
}

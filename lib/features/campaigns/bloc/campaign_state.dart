import 'package:equatable/equatable.dart';
import '../data/models/campaign_filter_model.dart';
import '../data/models/campaign_model.dart';

enum CampaignStatusState { initial, loading, loaded, error }

class CampaignState extends Equatable {
  final CampaignStatusState status;
  final List<CampaignModel> allCampaigns;
  final List<CampaignModel> filteredCampaigns;
  final CampaignModel? selectedCampaign;
  final String activeTab;
  final CampaignFilterModel filter;
  final String? errorMessage;

  const CampaignState({
    this.status = CampaignStatusState.initial,
    this.allCampaigns = const [],
    this.filteredCampaigns = const [],
    this.selectedCampaign,
    this.activeTab = 'all',
    this.filter = CampaignFilterModel.initial,
    this.errorMessage,
  });

  int get totalCount => allCampaigns.length;
  int get activeCount =>
      allCampaigns.where((c) => c.status == CampaignStatus.active).length;
  int get completedCount =>
      allCampaigns.where((c) => c.status == CampaignStatus.completed).length;
  int get draftsCount =>
      allCampaigns.where((c) => c.status == CampaignStatus.drafts).length;

  CampaignState copyWith({
    CampaignStatusState? status,
    List<CampaignModel>? allCampaigns,
    List<CampaignModel>? filteredCampaigns,
    CampaignModel? selectedCampaign,
    String? activeTab,
    CampaignFilterModel? filter,
    String? errorMessage,
  }) {
    return CampaignState(
      status: status ?? this.status,
      allCampaigns: allCampaigns ?? this.allCampaigns,
      filteredCampaigns: filteredCampaigns ?? this.filteredCampaigns,
      selectedCampaign: selectedCampaign ?? this.selectedCampaign,
      activeTab: activeTab ?? this.activeTab,
      filter: filter ?? this.filter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allCampaigns,
        filteredCampaigns,
        selectedCampaign,
        activeTab,
        filter,
        errorMessage,
      ];
}

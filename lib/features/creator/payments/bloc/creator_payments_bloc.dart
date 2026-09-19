import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/creator_payments_repository.dart';
import 'creator_payments_event.dart';
import 'creator_payments_state.dart';

class CreatorPaymentsBloc extends Bloc<CreatorPaymentsEvent, CreatorPaymentsState> {
  final CreatorPaymentsRepository repository;

  CreatorPaymentsBloc({required this.repository}) : super(const CreatorPaymentsState()) {
    on<LoadCreatorPaymentsData>(_onLoadData);
    on<FilterCreatorPaymentsByStatus>(_onFilterStatus);
  }

  Future<void> _onLoadData(
    LoadCreatorPaymentsData event,
    Emitter<CreatorPaymentsState> emit,
  ) async {
    emit(state.copyWith(status: CreatorPaymentsStatus.loading));
    try {
      final campaigns = await repository.getEarningCampaigns();
      final milestones = await repository.getPaymentMilestones();
      emit(state.copyWith(
        status: CreatorPaymentsStatus.success,
        campaigns: campaigns,
        milestones: milestones,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CreatorPaymentsStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterStatus(
    FilterCreatorPaymentsByStatus event,
    Emitter<CreatorPaymentsState> emit,
  ) {
    emit(state.copyWith(activeFilter: event.filter));
  }
}

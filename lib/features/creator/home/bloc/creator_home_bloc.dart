import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/creator_home_repository.dart';
import 'creator_home_event.dart';
import 'creator_home_state.dart';

class CreatorHomeBloc extends Bloc<CreatorHomeEvent, CreatorHomeState> {
  final CreatorHomeRepository repository;

  CreatorHomeBloc({required this.repository}) : super(const CreatorHomeState()) {
    on<LoadCreatorHomeOpportunities>(_onLoadOpportunities);
    on<FilterCreatorHomeOpportunities>(_onFilterOpportunities);
  }

  Future<void> _onLoadOpportunities(
    LoadCreatorHomeOpportunities event,
    Emitter<CreatorHomeState> emit,
  ) async {
    emit(state.copyWith(status: CreatorHomeStatus.loading));
    try {
      final opps = await repository.getOpportunities();
      emit(state.copyWith(
        status: CreatorHomeStatus.success,
        opportunities: opps,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CreatorHomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterOpportunities(
    FilterCreatorHomeOpportunities event,
    Emitter<CreatorHomeState> emit,
  ) {
    emit(state.copyWith(activeFilter: event.filter));
  }
}

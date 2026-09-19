import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/creator_my_works_repository.dart';
import 'creator_my_works_event.dart';
import 'creator_my_works_state.dart';

class CreatorMyWorksBloc extends Bloc<CreatorMyWorksEvent, CreatorMyWorksState> {
  final CreatorMyWorksRepository repository;

  CreatorMyWorksBloc({required this.repository}) : super(const CreatorMyWorksState()) {
    on<LoadCreatorWorksData>(_onLoadWorksData);
    on<FilterCreatorWorks>(_onFilterWorks);
  }

  Future<void> _onLoadWorksData(
    LoadCreatorWorksData event,
    Emitter<CreatorMyWorksState> emit,
  ) async {
    emit(state.copyWith(status: CreatorMyWorksStatus.loading));
    try {
      final works = await repository.getWorks();
      final deliverables = await repository.getDeliverables();
      final milestones = await repository.getMilestones();
      emit(state.copyWith(
        status: CreatorMyWorksStatus.success,
        works: works,
        deliverables: deliverables,
        milestones: milestones,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CreatorMyWorksStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterWorks(
    FilterCreatorWorks event,
    Emitter<CreatorMyWorksState> emit,
  ) {
    emit(state.copyWith(activeFilter: event.status));
  }
}

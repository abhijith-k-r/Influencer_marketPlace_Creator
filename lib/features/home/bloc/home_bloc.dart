import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../data/repositories/creator_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CreatorRepository creatorRepository;

  HomeBloc({required this.creatorRepository}) : super(const HomeState()) {
    on<LoadCreatorsEvent>((event, emit) async {
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        final creators = await creatorRepository.getTopCreators(
          filter: state.selectedFilter,
          query: state.searchQuery,
        );
        emit(state.copyWith(
          status: HomeStatus.success,
          creators: creators,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });

    on<SelectFilterEvent>((event, emit) async {
      emit(state.copyWith(selectedFilter: event.filter));
      add(const LoadCreatorsEvent());
    });

    on<SearchQueryChangedEvent>((event, emit) async {
      emit(state.copyWith(searchQuery: event.query));
      add(const LoadCreatorsEvent());
    });
  }
}

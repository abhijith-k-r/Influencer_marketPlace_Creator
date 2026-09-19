import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/creator_messages_repository.dart';
import 'creator_messages_event.dart';
import 'creator_messages_state.dart';

class CreatorMessagesBloc extends Bloc<CreatorMessagesEvent, CreatorMessagesState> {
  final CreatorMessagesRepository repository;

  CreatorMessagesBloc({required this.repository}) : super(const CreatorMessagesState()) {
    on<LoadCreatorMessages>(_onLoadMessages);
    on<FilterCreatorMessages>(_onFilterMessages);
  }

  Future<void> _onLoadMessages(
    LoadCreatorMessages event,
    Emitter<CreatorMessagesState> emit,
  ) async {
    emit(state.copyWith(status: CreatorMessagesStatus.loading));
    try {
      final convs = await repository.getConversations();
      final filtered = state.activeFilter == 'all'
          ? convs
          : convs.where((c) => c.categories.contains(state.activeFilter)).toList();
      emit(state.copyWith(
        status: CreatorMessagesStatus.success,
        allConversations: convs,
        filteredConversations: filtered,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CreatorMessagesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterMessages(
    FilterCreatorMessages event,
    Emitter<CreatorMessagesState> emit,
  ) {
    final filtered = event.filter == 'all'
        ? state.allConversations
        : state.allConversations.where((c) => c.categories.contains(event.filter)).toList();
    emit(state.copyWith(
      activeFilter: event.filter,
      filteredConversations: filtered,
    ));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../data/repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({required this.chatRepository}) : super(const ChatState()) {
    on<LoadConversationsEvent>((event, emit) async {
      emit(state.copyWith(status: ChatStatus.loading));
      try {
        final convos = await chatRepository.getConversations(
          filter: state.activeFilter,
        );
        emit(state.copyWith(
          status: ChatStatus.success,
          conversations: convos,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: ChatStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });

    on<SelectChatFilterEvent>((event, emit) async {
      emit(state.copyWith(activeFilter: event.filter));
      final convos = await chatRepository.getConversations(
        filter: event.filter,
      );
      emit(state.copyWith(conversations: convos));
    });

    on<OpenConversationEvent>((event, emit) async {
      emit(state.copyWith(
        activeThreadId: event.threadId,
        status: ChatStatus.loading,
      ));
      try {
        final messages =
            await chatRepository.getMessagesForThread(event.threadId);
        emit(state.copyWith(
          status: ChatStatus.success,
          activeMessages: messages,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: ChatStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });

    on<SendTextMessageEvent>((event, emit) async {
      if (event.text.trim().isEmpty) return;
      try {
        final newMsg = await chatRepository.sendMessage(
          threadId: event.threadId,
          text: event.text.trim(),
        );
        final updatedList = List.of(state.activeMessages)..add(newMsg);
        emit(state.copyWith(activeMessages: updatedList));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });
  }
}

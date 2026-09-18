import 'package:equatable/equatable.dart';
import '../data/models/chat_conversation_model.dart';
import '../data/models/chat_message_model.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatState extends Equatable {
  final ChatStatus status;
  final List<ChatConversationModel> conversations;
  final String activeFilter; // 'all', 'unread', 'deals', 'negotiations'
  final String? activeThreadId;
  final List<ChatMessageModel> activeMessages;
  final String? errorMessage;

  const ChatState({
    this.status = ChatStatus.initial,
    this.conversations = const [],
    this.activeFilter = 'all',
    this.activeThreadId,
    this.activeMessages = const [],
    this.errorMessage,
  });

  ChatState copyWith({
    ChatStatus? status,
    List<ChatConversationModel>? conversations,
    String? activeFilter,
    String? activeThreadId,
    List<ChatMessageModel>? activeMessages,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      conversations: conversations ?? this.conversations,
      activeFilter: activeFilter ?? this.activeFilter,
      activeThreadId: activeThreadId ?? this.activeThreadId,
      activeMessages: activeMessages ?? this.activeMessages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        conversations,
        activeFilter,
        activeThreadId,
        activeMessages,
        errorMessage,
      ];
}

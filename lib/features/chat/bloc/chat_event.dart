import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object?> get props => [];
}

class LoadConversationsEvent extends ChatEvent {
  const LoadConversationsEvent();
}

class SelectChatFilterEvent extends ChatEvent {
  final String filter;
  const SelectChatFilterEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

class OpenConversationEvent extends ChatEvent {
  final String threadId;
  const OpenConversationEvent(this.threadId);

  @override
  List<Object?> get props => [threadId];
}

class SendTextMessageEvent extends ChatEvent {
  final String threadId;
  final String text;
  const SendTextMessageEvent({required this.threadId, required this.text});

  @override
  List<Object?> get props => [threadId, text];
}

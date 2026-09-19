import 'package:equatable/equatable.dart';
import '../data/models/creator_conversation_model.dart';

enum CreatorMessagesStatus { initial, loading, success, failure }

class CreatorMessagesState extends Equatable {
  final CreatorMessagesStatus status;
  final List<CreatorConversationModel> allConversations;
  final List<CreatorConversationModel> filteredConversations;
  final String activeFilter;
  final String? errorMessage;

  const CreatorMessagesState({
    this.status = CreatorMessagesStatus.initial,
    this.allConversations = const [],
    this.filteredConversations = const [],
    this.activeFilter = 'all',
    this.errorMessage,
  });

  CreatorMessagesState copyWith({
    CreatorMessagesStatus? status,
    List<CreatorConversationModel>? allConversations,
    List<CreatorConversationModel>? filteredConversations,
    String? activeFilter,
    String? errorMessage,
  }) {
    return CreatorMessagesState(
      status: status ?? this.status,
      allConversations: allConversations ?? this.allConversations,
      filteredConversations: filteredConversations ?? this.filteredConversations,
      activeFilter: activeFilter ?? this.activeFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, allConversations, filteredConversations, activeFilter, errorMessage];
}

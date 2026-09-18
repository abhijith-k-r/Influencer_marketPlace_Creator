import 'package:equatable/equatable.dart';

class ChatConversationModel extends Equatable {
  final String id;
  final String creatorName;
  final String niche;
  final String avatarUrl;
  final String campaignTag;
  final String? milestoneTag;
  final String? dealAmount;
  final String lastMessage;
  final String timestamp;
  final int unreadCount;
  final bool hasUnreadDot;
  final String? attachmentName;
  final String? attachmentType; // video, contract, event, milestone, brief
  final String? deliveryStatus; // delivered, sent
  final String category; // 'unread', 'deals', 'negotiations'

  const ChatConversationModel({
    required this.id,
    required this.creatorName,
    required this.niche,
    required this.avatarUrl,
    required this.campaignTag,
    this.milestoneTag,
    this.dealAmount,
    required this.lastMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.hasUnreadDot = false,
    this.attachmentName,
    this.attachmentType,
    this.deliveryStatus,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        creatorName,
        niche,
        avatarUrl,
        campaignTag,
        milestoneTag,
        dealAmount,
        lastMessage,
        timestamp,
        unreadCount,
        hasUnreadDot,
        attachmentName,
        attachmentType,
        deliveryStatus,
        category,
      ];
}

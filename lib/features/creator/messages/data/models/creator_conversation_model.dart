import 'package:flutter/material.dart';

class CreatorConversationModel {
  final String id;
  final String brandName;
  final String timeAgo;
  final String campaignTag;
  final String? statusTag;
  final IconData? statusIcon;
  final bool isStatusEscrow;
  final String lastMessage;
  final int unreadCount;
  final String footerNote;
  final IconData? footerIcon;
  final String avatarUrl;
  final bool isVerified;
  final bool isOnline;
  final List<String> categories;
  final bool hasOfferActions;

  const CreatorConversationModel({
    required this.id,
    required this.brandName,
    required this.timeAgo,
    required this.campaignTag,
    this.statusTag,
    this.statusIcon,
    this.isStatusEscrow = false,
    required this.lastMessage,
    this.unreadCount = 0,
    required this.footerNote,
    this.footerIcon,
    required this.avatarUrl,
    this.isVerified = false,
    this.isOnline = false,
    required this.categories,
    this.hasOfferActions = false,
  });
}

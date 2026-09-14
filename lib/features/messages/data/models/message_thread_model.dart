import 'package:flutter/material.dart';

/// Data model representing an active campaign deal thread or brand inbound inquiry.
class MessageThreadModel {
  final String id;
  final String brandName;
  final String avatarUrl;
  final bool isVerified;
  final String contactName;
  final String contactRole;
  final String time;
  final String campaignName;
  final String deliverableSummary;
  final IconData deliverableIcon;
  final String lastMessage;
  final bool isUnread;
  final String statusText;
  final IconData statusIcon;
  final String dealAmount;
  final bool isDeal;
  final String? inboundQuote;

  const MessageThreadModel({
    required this.id,
    required this.brandName,
    required this.avatarUrl,
    this.isVerified = false,
    required this.contactName,
    required this.contactRole,
    required this.time,
    required this.campaignName,
    this.deliverableSummary = '',
    this.deliverableIcon = Icons.article_rounded,
    required this.lastMessage,
    this.isUnread = false,
    this.statusText = '',
    this.statusIcon = Icons.info_outline_rounded,
    this.dealAmount = '',
    this.isDeal = true,
    this.inboundQuote,
  });
}

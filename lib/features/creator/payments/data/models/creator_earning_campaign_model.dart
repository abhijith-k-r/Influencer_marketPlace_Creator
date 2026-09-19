import 'package:flutter/material.dart';

enum CreatorCampaignStatusType { inProgress, pendingEscrow, settled }

class CreatorEarningCampaignModel {
  final String id;
  final String brandName;
  final String brandCategory;
  final String campaignTitle;
  final String avatarUrl;
  final String statusLabel;
  final CreatorCampaignStatusType statusType;
  final String totalBudget;
  final double progressPercent;
  final String milestonesReleasedText;
  final String securedAmountText;
  final String? availableToRedeemAmount;
  final String footerNote;
  final IconData footerIcon;
  final bool isVerified;

  const CreatorEarningCampaignModel({
    required this.id,
    required this.brandName,
    required this.brandCategory,
    required this.campaignTitle,
    required this.avatarUrl,
    required this.statusLabel,
    required this.statusType,
    required this.totalBudget,
    required this.progressPercent,
    required this.milestonesReleasedText,
    required this.securedAmountText,
    this.availableToRedeemAmount,
    required this.footerNote,
    required this.footerIcon,
    this.isVerified = true,
  });

  // Convenience getters for widget compatibility
  String get earnedAmount => securedAmountText;
  String get totalDealAmount => totalBudget;
  double get progressRatio => progressPercent;
  String get status => statusLabel;
  String? get redeemableAmount => availableToRedeemAmount;
  String get milestonesSummary => milestonesReleasedText;
  String? get escrowAmount => totalBudget;
}

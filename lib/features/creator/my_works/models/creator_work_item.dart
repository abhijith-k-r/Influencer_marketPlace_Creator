import 'package:flutter/material.dart';

/// Represents an active or completed creator campaign collaboration.
class CreatorWorkItem {
  final String id;
  final String brandName;
  final String dealId;
  final String campaignTitle;
  final String category;
  final String status;
  final String agreedFee;
  final String timeline;
  final String durationSpecs;
  final int milestonesCompleted;
  final int milestonesTotal;
  final double progressRatio;
  final String nextStep;
  final IconData nextStepIcon;
  final String actionButtonText;
  final String? logoUrl;
  final bool isVerified;
  final bool isPublic;
  final String escrowLockedAmount;
  final String? submittedAgo;

  const CreatorWorkItem({
    required this.id,
    required this.brandName,
    required this.dealId,
    required this.campaignTitle,
    required this.category,
    required this.status,
    required this.agreedFee,
    required this.timeline,
    required this.durationSpecs,
    required this.milestonesCompleted,
    required this.milestonesTotal,
    required this.progressRatio,
    required this.nextStep,
    required this.nextStepIcon,
    this.actionButtonText = 'View Details',
    this.logoUrl,
    this.isVerified = true,
    this.isPublic = true,
    this.escrowLockedAmount = '₹40,000',
    this.submittedAgo,
  });
}

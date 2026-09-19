import 'package:flutter/material.dart';

class CreatorOpportunityModel {
  final String id;
  final String brandName;
  final String campaignTitle;
  final String avatarUrl;
  final String badgeText;
  final IconData badgeIcon;
  final String closesIn;
  final String assuredBudget;
  final String budgetNote;
  final String duration;
  final String category;
  final String deliverable;
  final IconData deliverableIcon;
  final bool isVerified;

  const CreatorOpportunityModel({
    required this.id,
    required this.brandName,
    required this.campaignTitle,
    required this.avatarUrl,
    required this.badgeText,
    required this.badgeIcon,
    required this.closesIn,
    required this.assuredBudget,
    required this.budgetNote,
    required this.duration,
    required this.category,
    required this.deliverable,
    required this.deliverableIcon,
    this.isVerified = true,
  });
}

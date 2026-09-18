import 'package:equatable/equatable.dart';

enum CampaignMilestoneStatus { completed, current, upcoming }

class CampaignMilestoneModel extends Equatable {
  final String id;
  final int stageNumber;
  final String title;
  final String subtitle;
  final double amount;
  final CampaignMilestoneStatus status;

  const CampaignMilestoneModel({
    required this.id,
    required this.stageNumber,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.status = CampaignMilestoneStatus.upcoming,
  });

  CampaignMilestoneModel copyWith({
    String? id,
    int? stageNumber,
    String? title,
    String? subtitle,
    double? amount,
    CampaignMilestoneStatus? status,
  }) {
    return CampaignMilestoneModel(
      id: id ?? this.id,
      stageNumber: stageNumber ?? this.stageNumber,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, stageNumber, title, subtitle, amount, status];
}

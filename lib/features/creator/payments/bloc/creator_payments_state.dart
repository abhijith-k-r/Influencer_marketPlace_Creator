import 'package:equatable/equatable.dart';
import '../data/models/creator_earning_campaign_model.dart';
import '../data/models/creator_payment_milestone_model.dart';

enum CreatorPaymentsStatus { initial, loading, success, failure }

class CreatorPaymentsState extends Equatable {
  final CreatorPaymentsStatus status;
  final List<CreatorEarningCampaignModel> campaigns;
  final List<CreatorPaymentMilestoneModel> milestones;
  final String activeFilter;
  final String? errorMessage;

  const CreatorPaymentsState({
    this.status = CreatorPaymentsStatus.initial,
    this.campaigns = const [],
    this.milestones = const [],
    this.activeFilter = 'All Campaigns',
    this.errorMessage,
  });

  List<CreatorEarningCampaignModel> get filteredCampaigns {
    switch (activeFilter) {
      case 'In Escrow':
        return campaigns
            .where((c) => c.statusType != CreatorCampaignStatusType.settled)
            .toList();
      case 'Settled':
        return campaigns
            .where((c) =>
                c.statusType == CreatorCampaignStatusType.settled ||
                c.statusLabel.contains('Settled'))
            .toList();
      case 'Action Required':
        return campaigns
            .where((c) =>
                c.availableToRedeemAmount != null ||
                c.statusLabel.contains('Action'))
            .toList();
      default:
        return campaigns;
    }
  }

  CreatorPaymentsState copyWith({
    CreatorPaymentsStatus? status,
    List<CreatorEarningCampaignModel>? campaigns,
    List<CreatorPaymentMilestoneModel>? milestones,
    String? activeFilter,
    String? errorMessage,
  }) {
    return CreatorPaymentsState(
      status: status ?? this.status,
      campaigns: campaigns ?? this.campaigns,
      milestones: milestones ?? this.milestones,
      activeFilter: activeFilter ?? this.activeFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        campaigns,
        milestones,
        activeFilter,
        errorMessage,
      ];
}

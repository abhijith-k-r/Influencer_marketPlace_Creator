import '../../../data/models/campaign_milestone_model.dart';
import '../../../data/models/campaign_model.dart';

const List<CampaignMilestoneModel> defaultCreationMilestones = [
  CampaignMilestoneModel(id: 'm1', stageNumber: 1, title: 'Concept & Script Approval', subtitle: '30% upfront protection', amount: 15000),
  CampaignMilestoneModel(id: 'm2', stageNumber: 2, title: 'Draft Reel Video Review', subtitle: '50% production gate', amount: 25000),
  CampaignMilestoneModel(id: 'm3', stageNumber: 3, title: 'Final Live Link & Analytics', subtitle: '20% post verification', amount: 10000),
];

CampaignMilestoneModel createSampleMilestone(int stageNumber) {
  return CampaignMilestoneModel(
    id: 'm$stageNumber',
    stageNumber: stageNumber,
    title: 'Custom Deliverable Milestone',
    subtitle: 'Milestone escrow deposit',
    amount: 5000,
  );
}

CampaignModel createCampaignModel({
  required String title,
  required String category,
  required CampaignAccessType type,
  required String imageUrl,
  required double budget,
  required int duration,
  required String brief,
  required List<CampaignMilestoneModel> milestones,
  required List<String> platforms,
}) {
  return CampaignModel(
    id: 'CK-${DateTime.now().millisecondsSinceEpoch % 100000}',
    title: title,
    brandName: 'UrbanKicks',
    category: category,
    status: CampaignStatus.active,
    accessType: type,
    dateRange: '18 Sep – 18 Nov 2026',
    imageUrl: imageUrl,
    totalBudget: budget,
    escrowBudget: budget,
    durationMonths: duration,
    deliverablesBrief: brief,
    milestones: milestones,
    targetPlatforms: platforms,
  );
}

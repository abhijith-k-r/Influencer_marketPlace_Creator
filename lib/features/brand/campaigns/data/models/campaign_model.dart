import 'package:equatable/equatable.dart';
import 'campaign_creator_applicant_model.dart';
import 'campaign_milestone_model.dart';

enum CampaignStatus { active, completed, drafts, expired }

enum CampaignAccessType { public, private }

class CampaignModel extends Equatable {
  final String id;
  final String title;
  final String brandName;
  final String category;
  final CampaignStatus status;
  final CampaignAccessType accessType;
  final String dateRange;
  final String imageUrl;
  final double totalBudget;
  final double escrowBudget;
  final int durationMonths;
  final String deliverablesBrief;
  final int applicantsCount;
  final int shortlistedCount;
  final int inReviewCount;
  final int postsLiveCount;
  final List<CampaignMilestoneModel> milestones;
  final List<CampaignCreatorApplicantModel> applicants;
  final List<String> targetPlatforms;
  final String creatorCriteria;
  final String deliverablesSpec;

  const CampaignModel({
    required this.id,
    required this.title,
    required this.brandName,
    required this.category,
    required this.status,
    required this.accessType,
    required this.dateRange,
    required this.imageUrl,
    required this.totalBudget,
    required this.escrowBudget,
    this.durationMonths = 2,
    this.deliverablesBrief = '',
    this.applicantsCount = 0,
    this.shortlistedCount = 0,
    this.inReviewCount = 0,
    this.postsLiveCount = 0,
    this.milestones = const [],
    this.applicants = const [],
    this.targetPlatforms = const ['Instagram', 'YouTube'],
    this.creatorCriteria = '10K – 100K Followers • ER > 4.0%',
    this.deliverablesSpec = '1x 60s 4K Reel + 2x Stories with swipe-up & tag',
  });

  @override
  List<Object?> get props => [
        id,
        title,
        brandName,
        category,
        status,
        accessType,
        dateRange,
        imageUrl,
        totalBudget,
        escrowBudget,
        durationMonths,
        applicantsCount,
        milestones,
        applicants,
      ];
}

import '../models/campaign_creator_applicant_model.dart';
import '../models/campaign_milestone_model.dart';

const List<CampaignMilestoneModel> sampleMilestonesList = [
  CampaignMilestoneModel(
    id: 'm1',
    stageNumber: 1,
    title: 'Script & Concept Sign-off',
    subtitle: 'Released • Oct 18',
    amount: 15000,
    status: CampaignMilestoneStatus.completed,
  ),
  CampaignMilestoneModel(
    id: 'm2',
    stageNumber: 2,
    title: 'Draft Reel Approval',
    subtitle: 'In Review • In Escrow',
    amount: 25000,
    status: CampaignMilestoneStatus.current,
  ),
  CampaignMilestoneModel(
    id: 'm3',
    stageNumber: 3,
    title: 'Final Live Link & 24h Metrics',
    subtitle: 'Locked in Vault',
    amount: 10000,
    status: CampaignMilestoneStatus.upcoming,
  ),
];

const List<CampaignCreatorApplicantModel> sampleApplicantsList = [
  CampaignCreatorApplicantModel(
    id: 'c1',
    name: 'Aarav Sharma',
    avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6',
    isVerified: true,
    fitPercentage: 96,
    status: ApplicantStatus.approved,
  ),
  CampaignCreatorApplicantModel(
    id: 'c2',
    name: 'Riya Sen',
    avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
    isVerified: true,
    fitPercentage: 94,
    status: ApplicantStatus.approved,
  ),
  CampaignCreatorApplicantModel(
    id: 'c3',
    name: 'Kabir Mehta',
    avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
    isVerified: true,
    fitPercentage: 91,
    status: ApplicantStatus.inNegotiation,
  ),
];

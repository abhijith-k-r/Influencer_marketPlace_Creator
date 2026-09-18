import '../models/campaign_creator_applicant_model.dart';
import '../models/campaign_milestone_model.dart';
import '../models/campaign_model.dart';
import 'mock_campaign_subdata.dart';

abstract final class MockCampaignData {
  static const List<CampaignMilestoneModel> sampleMilestones = sampleMilestonesList;
  static const List<CampaignCreatorApplicantModel> sampleApplicants = sampleApplicantsList;

  static final List<CampaignModel> campaigns = [
    CampaignModel(
      id: 'CK-89420',
      title: 'Sneaker Gen-2 Launch Drop',
      brandName: 'UrbanKicks',
      category: 'Fashion & Streetwear',
      status: CampaignStatus.active,
      accessType: CampaignAccessType.public,
      dateRange: '15 Oct – 15 Dec 2024',
      imageUrl: 'https://images.unsplash.com/photo-1552346154-21d32810aba3',
      totalBudget: 50000,
      escrowBudget: 40000,
      applicantsCount: 18,
      shortlistedCount: 3,
      inReviewCount: 3,
      milestones: sampleMilestones,
      applicants: sampleApplicants,
    ),
    CampaignModel(
      id: 'CK-89421',
      title: 'Diwali Festive Glam Reel',
      brandName: 'Festive Wear',
      category: 'Lifestyle',
      status: CampaignStatus.active,
      accessType: CampaignAccessType.private,
      dateRange: '20 Oct – 10 Nov 2024',
      imageUrl: 'https://images.unsplash.com/photo-1583391733956-3750e0ff4e8b',
      totalBudget: 75000,
      escrowBudget: 75000,
      applicantsCount: 5,
      shortlistedCount: 5,
      inReviewCount: 1,
      milestones: sampleMilestones,
      applicants: sampleApplicants,
    ),
    const CampaignModel(
      id: 'CK-89422',
      title: 'Wireless Earbuds Unboxing Blitz',
      brandName: 'AudioTech',
      category: 'Gadgets & Tech',
      status: CampaignStatus.completed,
      accessType: CampaignAccessType.public,
      dateRange: '01 Sep – 30 Sep 2024',
      imageUrl: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df',
      totalBudget: 35000,
      escrowBudget: 35000,
      postsLiveCount: 8,
    ),
    const CampaignModel(
      id: 'CK-89423',
      title: 'Summer Hydration Energy Drink',
      brandName: 'FitFuel',
      category: 'Health & Beverage',
      status: CampaignStatus.completed,
      accessType: CampaignAccessType.public,
      dateRange: '01 Aug – 31 Aug 2024',
      imageUrl: 'https://images.unsplash.com/photo-1622543925917-763c34d1a86e',
      totalBudget: 20000,
      escrowBudget: 20000,
    ),
    const CampaignModel(
      id: 'CK-89424',
      title: 'Winter Puffer Jacket Launch',
      brandName: 'ArcticWear',
      category: 'Fashion & Streetwear',
      status: CampaignStatus.drafts,
      accessType: CampaignAccessType.private,
      dateRange: '01 Nov – 31 Dec 2024',
      imageUrl: 'https://images.unsplash.com/photo-1544441893-675973e31985',
      totalBudget: 60000,
      escrowBudget: 0,
    ),
  ];
}

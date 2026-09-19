import '../models/creator_earning_campaign_model.dart';
import '../models/creator_payment_milestone_model.dart';
import '../models/mock_creator_earning_campaigns.dart';
import '../models/mock_creator_payment_milestones.dart';

abstract class CreatorPaymentsRepository {
  Future<List<CreatorEarningCampaignModel>> getEarningCampaigns();
  Future<List<CreatorPaymentMilestoneModel>> getPaymentMilestones();
}

class MockCreatorPaymentsRepository implements CreatorPaymentsRepository {
  @override
  Future<List<CreatorEarningCampaignModel>> getEarningCampaigns() async {
    return mockCreatorEarningCampaigns;
  }

  @override
  Future<List<CreatorPaymentMilestoneModel>> getPaymentMilestones() async {
    return mockCreatorPaymentMilestones;
  }
}

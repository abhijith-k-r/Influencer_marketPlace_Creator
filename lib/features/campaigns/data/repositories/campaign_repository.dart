import '../datasources/mock_campaign_data.dart';
import '../models/campaign_filter_model.dart';
import '../models/campaign_model.dart';

abstract class CampaignRepository {
  Future<List<CampaignModel>> getCampaigns({CampaignFilterModel? filter});
  Future<CampaignModel?> getCampaignById(String id);
  Future<void> createCampaign(CampaignModel campaign);
  Future<void> deleteCampaign(String id);
}

class MockCampaignRepository implements CampaignRepository {
  final List<CampaignModel> _campaigns;

  MockCampaignRepository({List<CampaignModel>? initialCampaigns})
      : _campaigns = List.from(initialCampaigns ?? MockCampaignData.campaigns);

  @override
  Future<List<CampaignModel>> getCampaigns({CampaignFilterModel? filter}) async {
    await Future.delayed(const Duration(milliseconds: 150));
    if (filter == null) return List.unmodifiable(_campaigns);

    return _campaigns.where((c) {
      if (filter.searchQuery.isNotEmpty) {
        final query = filter.searchQuery.toLowerCase();
        final matchTitle = c.title.toLowerCase().contains(query);
        final matchCategory = c.category.toLowerCase().contains(query);
        final matchBrand = c.brandName.toLowerCase().contains(query);
        if (!matchTitle && !matchCategory && !matchBrand) return false;
      }

      if (filter.selectedStatuses.isNotEmpty &&
          !filter.selectedStatuses.contains(c.status)) {
        return false;
      }

      if (filter.selectedAccessType != null &&
          c.accessType != filter.selectedAccessType) {
        return false;
      }

      if (c.totalBudget < filter.minBudget ||
          c.totalBudget > filter.maxBudget) {
        return false;
      }

      return true;
    }).toList();
  }

  @override
  Future<CampaignModel?> getCampaignById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    try {
      return _campaigns.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> createCampaign(CampaignModel campaign) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _campaigns.insert(0, campaign);
  }

  @override
  Future<void> deleteCampaign(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _campaigns.removeWhere((c) => c.id == id);
  }
}

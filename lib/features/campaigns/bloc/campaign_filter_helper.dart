import '../data/models/campaign_filter_model.dart';
import '../data/models/campaign_model.dart';

List<CampaignModel> filterCampaigns(
  List<CampaignModel> list,
  String tab,
  CampaignFilterModel filter,
) {
  return list.where((c) {
    if (tab == 'active' && c.status != CampaignStatus.active) return false;
    if (tab == 'completed' && c.status != CampaignStatus.completed) return false;
    if (tab == 'drafts' && c.status != CampaignStatus.drafts) return false;
    if (filter.searchQuery.isNotEmpty) {
      final q = filter.searchQuery.toLowerCase();
      final match = c.title.toLowerCase().contains(q) ||
          c.category.toLowerCase().contains(q) ||
          c.brandName.toLowerCase().contains(q);
      if (!match) return false;
    }
    return true;
  }).toList();
}

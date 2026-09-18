import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../data/models/campaign_model.dart';
import 'campaign_card_body.dart';
import 'campaign_card_footer.dart';
import 'campaign_card_header.dart';

class CampaignCardTile extends StatelessWidget {
  final CampaignModel campaign;
  final VoidCallback onTap;

  const CampaignCardTile({
    super.key,
    required this.campaign,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppRadii.xl),
          boxShadow: const [
            BoxShadow(
              color: Color(0x060B1C30),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampaignCardHeader(
              accessType: campaign.accessType,
              status: campaign.status,
              dateRange: campaign.dateRange,
            ),
            const SizedBox(height: 12),
            CampaignCardBody(campaign: campaign),
            const SizedBox(height: 12),
            CampaignCardFooter(
              budget: campaign.totalBudget,
              onViewDetails: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';
import 'campaign_card_metric_row.dart';

class CampaignCardBody extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignCardBody({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.md),
              child: Image.network(
                campaign.imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 48,
                  height: 48,
                  color: AppColors.surfaceContainerHigh,
                  child: const Icon(Icons.image, color: AppColors.tertiary),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    campaign.title,
                    style: AppTextStyles.headlineSm(color: AppColors.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${campaign.brandName} • ${campaign.category}',
                    style: AppTextStyles.bodySm(color: AppColors.tertiary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CampaignCardMetricRow(campaign: campaign),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/data/models/creator_earning_campaign_model.dart';

class CreatorCampaignEarningFooter extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;
  final VoidCallback onTap;

  const CreatorCampaignEarningFooter({
    super.key,
    required this.campaign,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSettled = campaign.status == 'Settled';
    final hasRedeem = campaign.redeemableAmount != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.task_alt_rounded,
                size: 16,
                color: isSettled ? CreatorColors.outline : CreatorColors.primary,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  campaign.milestonesSummary,
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        if (hasRedeem) ...[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.creatorPaymentRedeem);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CreatorColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: const Size(0, 32),
            ),
            child: Text(
              'Redeem ${campaign.redeemableAmount}',
              style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ] else ...[
          InkWell(
            onTap: onTap,
            borderRadius: AppRadii.roundedMd,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Text(
                    'View Details',
                    style: AppTextStyles.labelSm(
                      color: CreatorColors.primary,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: CreatorColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

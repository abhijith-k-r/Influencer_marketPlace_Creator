import 'package:flutter/material.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/creator_colors.dart';
import '../../models/creator_earning_campaign_model.dart';

class CreatorCampaignEarningFooter extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;

  const CreatorCampaignEarningFooter({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final c = campaign;
    final isSettled = c.statusType == CreatorCampaignStatusType.settled;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(c.footerIcon, size: 16, color: CreatorColors.primary),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  c.footerNote,
                  style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.creatorPaymentDetails),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(color: CreatorColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Text(
                  isSettled ? 'View Receipt' : 'View Details',
                  style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.arrow_forward_rounded, size: 14, color: CreatorColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

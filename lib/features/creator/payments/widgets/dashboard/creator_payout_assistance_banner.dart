import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/creator_colors.dart';

class CreatorPayoutAssistanceBanner extends StatelessWidget {
  const CreatorPayoutAssistanceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: CreatorColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: CreatorColors.primary.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.support_agent_rounded, size: 22, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payout Assistance', style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  'Dispute a release or change default IFSC bank account.',
                  style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connecting to 24/7 Creator Payment Support...'), duration: Duration(seconds: 2)),
              );
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: CreatorColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 4, offset: Offset(0, 2))],
              ),
              child: Text(
                'Contact',
                style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

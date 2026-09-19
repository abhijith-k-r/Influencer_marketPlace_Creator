import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorSettlementHistoryCard extends StatelessWidget {
  const CreatorSettlementHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Settlement History',
                style: AppTextStyles.labelLg(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Instant IMPS/UPI',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSettlementRow(
            title: 'Concept Script Payout',
            date: '12 Sep 2024 • 14:32',
            amount: '+ ₹10,000.00',
            ref: 'UTR-9821839120',
          ),
        ],
      ),
    );
  }

  Widget _buildSettlementRow({
    required String title,
    required String date,
    required String amount,
    required String ref,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0x1F00A86B),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_downward_rounded, size: 16, color: Color(0xFF00A86B)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '$date • Ref: $ref',
                style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: AppTextStyles.labelMd(color: const Color(0xFF00A86B)).copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

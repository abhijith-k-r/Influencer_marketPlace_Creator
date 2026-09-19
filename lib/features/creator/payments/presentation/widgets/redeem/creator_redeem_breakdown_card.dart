import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemBreakdownCard extends StatelessWidget {
  const CreatorRedeemBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payout Summary',
            style: AppTextStyles.labelLg(
              color: CreatorColors.onSurface,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          _buildSummaryRow(label: 'Gross Milestone Amount', value: '₹2,000.00'),
          const SizedBox(height: 8),
          _buildSummaryRow(
            label: 'Escrow Processing Fee',
            value: '₹0.00 (Waived)',
            valueColor: const Color(0xFF00A86B),
          ),
          const SizedBox(height: 8),
          _buildSummaryRow(
            label: 'Statutory TDS (Sec 194J 1%)',
            value: '- ₹20.00',
            valueColor: CreatorColors.outline,
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Net Disbursable Amount',
                style: AppTextStyles.labelLg(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '₹1,980.00',
                style: AppTextStyles.headlineSm(
                  color: CreatorColors.primary,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySm(color: CreatorColors.outline)),
        Text(
          value,
          style: AppTextStyles.bodySm(
            color: valueColor ?? CreatorColors.onSurface,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

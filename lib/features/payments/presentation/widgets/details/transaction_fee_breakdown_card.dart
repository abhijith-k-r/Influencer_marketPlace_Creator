import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class TransactionFeeBreakdownCard extends StatelessWidget {
  final PaymentTransactionModel transaction;

  const TransactionFeeBreakdownCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Column(
        children: [
          _buildRow('Gross Milestone Amount', '₹25,000.00'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Platform Escrow Fee',
                    style: AppTextStyles.bodySm(color: AppColors.tertiary),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadii.full),
                    ),
                    child: Text(
                      'Waived',
                      style: AppTextStyles.labelSm(color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
              Text(
                '₹0.00',
                style: AppTextStyles.labelMd(color: AppColors.secondary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'TDS Deducted (Sec 194J)',
                    style: AppTextStyles.bodySm(color: AppColors.tertiary),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.info_outline, size: 14, color: AppColors.tertiary),
                ],
              ),
              Text(
                '- ₹250.00',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ],
          ),
          const Divider(height: 20, color: AppColors.surfaceContainerHigh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Net Disbursed to Creator',
                style: AppTextStyles.labelLg(color: AppColors.onSurface),
              ),
              Text(
                '₹24,750.00',
                style: AppTextStyles.headlineSm(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySm(color: AppColors.tertiary)),
        Text(value, style: AppTextStyles.labelMd(color: AppColors.onSurface)),
      ],
    );
  }
}

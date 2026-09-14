import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'payout_bank_tile.dart';
import 'payout_compliance_agreement.dart';

/// Payout bank destination selector with compliance agreement and confirmation button.
class PayoutDestinationCard extends StatelessWidget {
  final bool isAgreed;
  final ValueChanged<bool> onAgreementChanged;
  final VoidCallback onConfirm;

  const PayoutDestinationCard({
    super.key,
    required this.isAgreed,
    required this.onAgreementChanged,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedLg,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payout Destination', style: AppTextStyles.h4),
          const SizedBox(height: 12),
          const PayoutBankTile(),
          const SizedBox(height: 14),
          PayoutComplianceAgreement(
            isAgreed: isAgreed,
            onAgreementChanged: onAgreementChanged,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: isAgreed ? onConfirm : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: AppColors.borderLight,
                shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_rounded, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Confirm Payout (₹1,800)',
                    style: AppTextStyles.buttonPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

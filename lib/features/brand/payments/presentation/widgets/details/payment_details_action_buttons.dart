import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class PaymentDetailsActionButtons extends StatelessWidget {
  final VoidCallback onDownloadInvoice;
  final VoidCallback onRaiseDispute;

  const PaymentDetailsActionButtons({
    super.key,
    required this.onDownloadInvoice,
    required this.onRaiseDispute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: onDownloadInvoice,
            icon: const Icon(Icons.receipt_long_rounded, size: 20),
            label: Text(
              'Download Official Tax Invoice & Receipt',
              style: AppTextStyles.labelLg(color: AppColors.primary),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerLowest,
              foregroundColor: AppColors.primary,
              elevation: 0,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadii.xl),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 42,
          child: TextButton.icon(
            onPressed: onRaiseDispute,
            icon: const Icon(Icons.flag_outlined, size: 16),
            label: Text(
              'Report an Issue / Raise Escrow Dispute',
              style: AppTextStyles.labelMd(color: AppColors.tertiary),
            ),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}

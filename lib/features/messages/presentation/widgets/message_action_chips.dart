import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Horizontal action chip bar for quick actions in creator messaging.
class MessageActionChips extends StatelessWidget {
  final VoidCallback? onPaymentAgreementTap;

  const MessageActionChips({super.key, this.onPaymentAgreementTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildChip(Icons.description_outlined, 'View Agreement', null),
          const SizedBox(width: 8),
          _buildChip(
            Icons.credit_card_outlined,
            'Payment Agreement',
            onPaymentAgreementTap,
          ),
          const SizedBox(width: 8),
          _buildChip(Icons.file_upload_outlined, 'Submit Content', null),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String label, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.roundedPill,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: const BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: AppRadii.roundedPill,
          boxShadow: AppShadows.subtle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.chipAction,
            ),
          ],
        ),
      ),
    );
  }
}

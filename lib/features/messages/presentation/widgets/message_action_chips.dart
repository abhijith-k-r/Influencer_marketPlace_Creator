import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

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
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [
            BoxShadow(
              color: Color(0x06000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

/// Escrow safety badge and version info at the base of Brand drawer.
class BrandDrawerEscrowFooter extends StatelessWidget {
  const BrandDrawerEscrowFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.surfaceContainerHigh),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.shield_rounded, size: 18, color: AppColors.secondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '100% Escrow Milestone Protected',
                  style: AppTextStyles.labelSm(color: AppColors.onSurface).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text('CollabConnect v2.4.0 • Enterprise', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
      ],
    );
  }
}

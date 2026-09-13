import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';

/// Segmented password strength indicator reacting dynamically to entered password.
class PasswordStrengthMeter extends StatelessWidget {
  final int strength; // 0 to 3

  const PasswordStrengthMeter({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        children: [
          _buildBar(segmentIndex: 1),
          AppSpacing.horizontalXs,
          _buildBar(segmentIndex: 2),
          AppSpacing.horizontalXs,
          _buildBar(segmentIndex: 3),
        ],
      ),
    );
  }

  Widget _buildBar({required int segmentIndex}) {
    final bool isActive = strength >= segmentIndex;
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.strengthInactive,
          borderRadius: AppRadii.roundedPill,
        ),
      ),
    );
  }
}

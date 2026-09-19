import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/role_selection/data/models/user_role.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Bottom confirmation CTA button for RoleSelectionScreen.
class RoleSelectionCta extends StatelessWidget {
  final bool hasSelection;
  final VoidCallback onConfirm;
  final UserRole? selectedRole;

  const RoleSelectionCta({
    super.key,
    required this.hasSelection,
    required this.onConfirm,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    final isCreator = selectedRole == UserRole.creator;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: hasSelection
            ? isCreator
                  ? CreatorColors.primary
                  : AppColors.primary
            : AppColors.surfaceContainerHigh,
        borderRadius: AppRadii.roundedLg,
        boxShadow: hasSelection
            ? [
                BoxShadow(
                  color: isCreator
                      ? CreatorColors.secondary
                      : AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: hasSelection ? onConfirm : null,
          borderRadius: AppRadii.roundedLg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hasSelection
                    ? 'Continue to Platform'
                    : 'Select a Role to Continue',
                style: AppTextStyles.labelLg(
                  color: hasSelection ? Colors.white : AppColors.tertiary,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              if (hasSelection) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

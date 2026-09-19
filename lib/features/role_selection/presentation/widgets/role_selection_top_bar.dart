import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/shared/app_icon_button.dart';
import '../../data/models/user_role.dart';

/// Top bar with back button, help link, step badge, and headline for Role Selection (<75 LOC).
class RoleSelectionTopBar extends StatelessWidget {
  final UserRole? selectedRole;

  const RoleSelectionTopBar({super.key, this.selectedRole});

  @override
  Widget build(BuildContext context) {
    final isCreator = selectedRole == UserRole.creator;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButton(
              icon: Icons.arrow_back,
              iconSize: 20,
              onTap: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('Help', style: AppTextStyles.labelMd(color: AppColors.tertiary)),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isCreator ? AppColors.secondaryFixed : AppColors.primaryFixed,
            borderRadius: AppRadii.roundedPill,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 13,
                color: isCreator ? AppColors.onSecondaryFixedVariant : AppColors.onPrimaryFixed,
              ),
              const SizedBox(width: 5),
              Text(
                'STEP 1 OF 3',
                style: AppTextStyles.labelSm(
                  color: isCreator ? AppColors.onSecondaryFixedVariant : AppColors.onPrimaryFixed,
                ).copyWith(letterSpacing: 0.8),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text('Choose Your Role', style: AppTextStyles.headlineLg(color: AppColors.onSurface)),
        const SizedBox(height: 6),
        Text(
          'Tailor your experience to connect, collaborate, and scale authentic partnerships.',
          style: AppTextStyles.bodyMd(color: AppColors.tertiary),
        ),
      ],
    );
  }
}

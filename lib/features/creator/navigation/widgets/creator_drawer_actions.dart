import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../../auth/presentation/views/auth_bottom_sheet.dart';
import 'creator_auth_button.dart';

class CreatorDrawerActions extends StatelessWidget {
  const CreatorDrawerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreatorAuthButton(
          color: CreatorColors.primary,
          textColor: Colors.white,
          iconColor: Colors.white,
          icon: Icons.person_add_alt_1_rounded,
          trailing: Icons.arrow_forward_rounded,
          text: 'Sign Up Free',
          onTap: () {
            Navigator.of(context).pop();
            AuthBottomSheet.show(context);
          },
          hasShadow: true,
        ),
        const SizedBox(height: 10),
        CreatorAuthButton(
          color: CreatorColors.surfaceContainer,
          textColor: CreatorColors.onSurface,
          iconColor: CreatorColors.outline,
          icon: Icons.login_rounded,
          trailing: Icons.chevron_right_rounded,
          text: 'Sign In',
          onTap: () {
            Navigator.of(context).pop();
            AuthBottomSheet.show(context);
          },
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(AppRoutes.brandShell);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                const Icon(Icons.swap_horiz_rounded, size: 18, color: CreatorColors.primary),
                const SizedBox(width: 8),
                Text(
                  'Switch to Brand Portal',
                  style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

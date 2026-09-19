import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/shared/app_icon_button.dart';
import '../../../../../../core/widgets/shared/app_network_avatar.dart';

/// Top bar header for Brand Payment Dashboard using AppIconButton and AppNetworkAvatar (<75 LOC).
class PaymentDashboardHeader extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const PaymentDashboardHeader({
    super.key,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withValues(alpha: 0.92),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.flash_on_rounded, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COLLABCONNECT',
                    style: AppTextStyles.labelSm(color: AppColors.tertiary),
                  ),
                  Text(
                    'Payment',
                    style: AppTextStyles.headlineSm(color: AppColors.onSurface),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              AppIconButton(
                icon: Icons.notifications_outlined,
                iconSize: 20,
                onTap: onNotificationTap,
              ),
              const SizedBox(width: 8),
              AppNetworkAvatar(
                radius: 16,
                fallbackIcon: Icons.person,
                onTap: onProfileTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

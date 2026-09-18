import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? customContent;
  final IconData trailingIcon;
  final VoidCallback? onTap;

  const ProfileInfoTile({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.customContent,
    this.trailingIcon = Icons.chevron_right_rounded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: AppTextStyles.labelSm(
                      color: AppColors.tertiary,
                    ).copyWith(
                      letterSpacing: 0.8,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  if (customContent != null)
                    customContent!
                  else
                    Text(
                      value ?? '',
                      style: AppTextStyles.bodyMd(
                        color: AppColors.onSurface,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),
            Icon(
              trailingIcon,
              size: 20,
              color: AppColors.tertiaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}

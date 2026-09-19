import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Reusable social / credential auth button tile inside auth modal.
class AuthOptionTile extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Widget? leadingWidget;
  final IconData? leadingIcon;
  final Color? leadingBgColor;
  final Color? leadingIconColor;
  final String title;
  final String? trailingBadgeText;
  final Color? trailingBadgeBg;
  final Color? trailingBadgeColor;
  final IconData trailingIcon;
  final Color? trailingIconColor;
  final bool isLoading;
  final VoidCallback onTap;

  const AuthOptionTile({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.leadingWidget,
    this.leadingIcon,
    this.leadingBgColor,
    this.leadingIconColor,
    required this.title,
    this.trailingBadgeText,
    this.trailingBadgeBg,
    this.trailingBadgeColor,
    this.trailingIcon = Icons.chevron_right,
    this.trailingIconColor,
    this.isLoading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: AppRadii.roundedLg,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppRadii.roundedLg,
          border: backgroundColor == Colors.white ||
                  backgroundColor == AppColors.surfaceContainerLowest
              ? Border.all(color: AppColors.surfaceContainerHigh)
              : null,
        ),
        child: Row(
          children: [
            if (leadingWidget != null)
              leadingWidget!
            else if (leadingIcon != null)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: leadingBgColor ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(leadingIcon, size: 18, color: leadingIconColor),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.labelLg(color: textColor).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (trailingBadgeText != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: trailingBadgeBg,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  trailingBadgeText!,
                  style: AppTextStyles.labelSm(
                    color: trailingBadgeColor ?? Colors.white,
                  ).copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Icon(trailingIcon, size: 18, color: trailingIconColor ?? textColor),
          ],
        ),
      ),
    );
  }
}

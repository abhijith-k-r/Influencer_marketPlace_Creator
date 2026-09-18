import 'package:flutter/material.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

class CreatorAuthButtonTile extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final Widget? leading;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final Color? leadingBgColor;
  final String? badgeText;
  final Color? badgeBg;
  final Color? badgeTextColor;
  final IconData trailingIcon;
  final Color trailingIconColor;
  final bool isLoading;
  final VoidCallback onTap;

  const CreatorAuthButtonTile({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    this.leading,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingBgColor,
    this.badgeText,
    this.badgeBg,
    this.badgeTextColor,
    this.trailingIcon = Icons.chevron_right_rounded,
    this.trailingIconColor = Colors.white,
    this.isLoading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              if (leading != null)
                leading!
              else if (leadingIcon != null)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(color: leadingBgColor, borderRadius: BorderRadius.circular(8)),
                  child: Icon(leadingIcon, size: 18, color: leadingIconColor),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelLg(color: textColor).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if (isLoading)
                const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              else ...[
                if (badgeText != null)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(color: badgeBg, borderRadius: AppRadii.roundedPill),
                    child: Text(
                      badgeText!,
                      style: AppTextStyles.labelSm(color: badgeTextColor ?? Colors.white).copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 9,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                Icon(trailingIcon, size: 18, color: trailingIconColor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

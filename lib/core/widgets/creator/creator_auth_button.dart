import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/creator_colors.dart';

class CreatorAuthButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color iconColor;
  final IconData icon;
  final IconData trailing;
  final String text;
  final VoidCallback onTap;
  final bool hasShadow;

  const CreatorAuthButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.iconColor,
    required this.icon,
    required this.trailing,
    required this.text,
    required this.onTap,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        boxShadow: hasShadow
            ? [BoxShadow(color: CreatorColors.primary.withValues(alpha: 0.25), blurRadius: 12, offset: const Offset(0, 4))]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(icon, size: 20, color: iconColor),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.labelLg(color: textColor).copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(trailing, size: 18, color: iconColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

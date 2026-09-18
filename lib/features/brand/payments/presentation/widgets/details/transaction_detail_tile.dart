import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class TransactionDetailTile extends StatelessWidget {
  final Widget? leading;
  final String label;
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const TransactionDetailTile({
    super.key,
    this.leading,
    required this.label,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 10)],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                  const SizedBox(height: 2),
                  Text(title, style: AppTextStyles.labelLg()),
                  if (subtitle != null) ...[
                    const SizedBox(height: 1),
                    Text(subtitle!, style: AppTextStyles.bodySm(color: AppColors.tertiary)),
                  ],
                ],
              ),
            ],
          ),
          ?trailing,
        ],
      ),
    );
  }
}

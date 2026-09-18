import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Status pill badge with corresponding color tokens and leading icons.
class MyWorksStatusBadge extends StatelessWidget {
  final String status;

  const MyWorksStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isInProgress = status == 'In Progress';
    final isAccepted = status == 'Accepted';
    final isPaid = status == 'Paid';

    final Color bgColor;
    final Color textColor;
    final Widget leading;

    if (isInProgress) {
      bgColor = CreatorColors.primaryFixed;
      textColor = CreatorColors.onPrimaryFixedVariant;
      leading = Container(
        width: 6,
        height: 6,
        margin: const EdgeInsets.only(right: 6),
        decoration: const BoxDecoration(
          color: CreatorColors.primaryContainer,
          shape: BoxShape.circle,
        ),
      );
    } else if (isAccepted) {
      bgColor = CreatorColors.surfaceContainerHigh;
      textColor = CreatorColors.onSurface;
      leading = const Padding(
        padding: EdgeInsets.only(right: 4),
        child: Icon(Icons.check_circle_rounded, size: 14, color: CreatorColors.primaryContainer),
      );
    } else if (isPaid) {
      bgColor = CreatorColors.surfaceContainer;
      textColor = CreatorColors.onSurfaceVariant;
      leading = const Padding(
        padding: EdgeInsets.only(right: 4),
        child: Icon(Icons.task_alt_rounded, size: 14, color: CreatorColors.primaryContainer),
      );
    } else {
      bgColor = CreatorColors.surfaceContainerHigh;
      textColor = CreatorColors.onSurfaceVariant;
      leading = const Padding(
        padding: EdgeInsets.only(right: 4),
        child: Icon(Icons.hourglass_top_rounded, size: 14, color: CreatorColors.tertiary),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadii.roundedFull,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading,
          Text(
            status.toUpperCase(),
            style: AppTextStyles.labelSm(
              color: textColor,
            ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

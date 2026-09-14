import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'milestone_status.dart';

/// Timeline indicator circle node and vertical connector pipe.
class MilestoneIndicatorNode extends StatelessWidget {
  final MilestoneStatus status;
  final bool isLast;

  const MilestoneIndicatorNode({
    super.key,
    required this.status,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: _indicatorBg(),
            shape: BoxShape.circle,
            border: Border.all(color: _indicatorBorder(), width: 2),
          ),
          child: Center(child: _indicatorIcon()),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              color: status == MilestoneStatus.paid
                  ? AppColors.emerald
                  : AppColors.borderLight,
            ),
          ),
      ],
    );
  }

  Color _indicatorBg() {
    switch (status) {
      case MilestoneStatus.paid:
        return AppColors.emerald;
      case MilestoneStatus.ready:
        return AppColors.indigoPurple;
      case MilestoneStatus.inProgress:
        return AppColors.amber;
      case MilestoneStatus.locked:
        return AppColors.scaffoldBackground;
    }
  }

  Color _indicatorBorder() {
    switch (status) {
      case MilestoneStatus.paid:
        return AppColors.emerald;
      case MilestoneStatus.ready:
        return AppColors.indigoBorder;
      case MilestoneStatus.inProgress:
        return AppColors.amberBorder;
      case MilestoneStatus.locked:
        return AppColors.borderLight;
    }
  }

  Widget _indicatorIcon() {
    switch (status) {
      case MilestoneStatus.paid:
        return const Icon(Icons.check_rounded, color: AppColors.textWhite, size: 16);
      case MilestoneStatus.ready:
        return const Icon(Icons.bolt_rounded, color: AppColors.textWhite, size: 16);
      case MilestoneStatus.inProgress:
        return const Icon(Icons.trending_up_rounded, color: AppColors.textWhite, size: 16);
      case MilestoneStatus.locked:
        return const Icon(Icons.lock_outline_rounded, color: AppColors.textTertiary, size: 14);
    }
  }
}

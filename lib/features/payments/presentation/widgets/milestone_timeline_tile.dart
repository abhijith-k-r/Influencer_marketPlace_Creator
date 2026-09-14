import 'package:flutter/material.dart';
import 'milestone_indicator_node.dart';
import 'milestone_status.dart';
import 'milestone_tile_card.dart';

export 'milestone_status.dart';

/// Single timeline tile item showing progress node and detail card.
class MilestoneTimelineTile extends StatelessWidget {
  final int step;
  final String title;
  final String amount;
  final String description;
  final MilestoneStatus status;
  final double progress;
  final bool isLast;
  final VoidCallback? onTap;

  const MilestoneTimelineTile({
    super.key,
    required this.step,
    required this.title,
    required this.amount,
    required this.description,
    required this.status,
    this.progress = 0.0,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilestoneIndicatorNode(status: status, isLast: isLast),
          const SizedBox(width: 14),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: MilestoneTileCard(
                title: title,
                amount: amount,
                description: description,
                status: status,
                progress: progress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

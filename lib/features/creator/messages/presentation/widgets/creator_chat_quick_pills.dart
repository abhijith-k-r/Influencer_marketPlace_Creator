import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorChatQuickPills extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const CreatorChatQuickPills({super.key, required this.onSelect});

  static const List<String> quickReplies = [
    '📤 Submit Draft Reel',
    '📊 Share Insights',
    '🔒 Request Milestone Escrow',
    '✅ Confirm Post Live',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: quickReplies.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final reply = quickReplies[index];
          return InkWell(
            borderRadius: AppRadii.roundedFull,
            onTap: () => onSelect(reply),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: const BoxDecoration(
                color: CreatorColors.surfaceContainerLowest,
                borderRadius: AppRadii.roundedFull,
              ),
              child: Center(
                child: Text(
                  reply,
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.primary,
                  ).copyWith(fontWeight: FontWeight.w600, fontSize: 11),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

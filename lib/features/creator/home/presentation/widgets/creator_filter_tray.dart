import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorFilterTray extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterChanged;

  const CreatorFilterTray({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });

  static const List<Map<String, String>> filters = [
    {'id': 'all', 'label': 'All Deals (14)'},
    {'id': 'escrow', 'label': '🔒 100% Escrow Backed'},
    {'id': 'reels', 'label': '🎬 Reels & Shorts'},
    {'id': 'lifestyle', 'label': '👟 Streetwear & Tech'},
    {'id': 'high_payout', 'label': '⚡ ₹50k+ Fast Pay'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = filters[index];
          final isSelected = item['id'] == activeFilter;

          return InkWell(
            borderRadius: AppRadii.roundedFull,
            onTap: () => onFilterChanged(item['id']!),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? CreatorColors.primary : CreatorColors.surfaceContainerLowest,
                borderRadius: AppRadii.roundedFull,
                boxShadow: isSelected
                    ? const [BoxShadow(color: Color(0x3D3B46F1), blurRadius: 8, offset: Offset(0, 3))]
                    : AppShadows.cardSoft,
              ),
              child: Center(
                child: Text(
                  item['label']!,
                  style: AppTextStyles.labelSm(
                    color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant,
                  ).copyWith(fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

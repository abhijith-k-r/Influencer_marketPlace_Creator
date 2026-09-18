import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorChatFilterCarousel extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterChanged;

  const CreatorChatFilterCarousel({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildChip('all', 'All Messages', count: '5'),
          const SizedBox(width: 8),
          _buildChip('unread', 'Unread', count: '2'),
          const SizedBox(width: 8),
          _buildChip('escrow', 'Deals in Escrow', icon: Icons.lock_rounded),
          const SizedBox(width: 8),
          _buildChip('pitches', 'Pitch Replies'),
        ],
      ),
    );
  }

  Widget _buildChip(String filterKey, String label, {String? count, IconData? icon}) {
    final isSelected = activeFilter == filterKey;

    return InkWell(
      onTap: () => onFilterChanged(filterKey),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? CreatorColors.primary : CreatorColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isSelected ? CreatorColors.primary.withValues(alpha: 0.25) : const Color(0x060B1C30),
              blurRadius: isSelected ? 10 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: isSelected ? Colors.white : CreatorColors.primary),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: AppTextStyles.labelMd(color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant),
            ),
            if (count != null) ...[
              const SizedBox(width: 6),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withValues(alpha: 0.25) : CreatorColors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    count,
                    style: AppTextStyles.labelSm(color: isSelected ? Colors.white : CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

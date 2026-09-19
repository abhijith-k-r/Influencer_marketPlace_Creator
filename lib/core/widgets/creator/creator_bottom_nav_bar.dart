import 'package:flutter/material.dart';
import '../../theme/app_shadows.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/creator_colors.dart';

class CreatorBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CreatorBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest.withValues(alpha: 0.95),
        boxShadow: AppShadows.bottomNav,
        border: Border(
          top: BorderSide(
            color: CreatorColors.surfaceContainer.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(0, Icons.home_rounded, 'Home'),
              _buildItem(1, Icons.forum_rounded, 'Message'),
              _buildItem(2, Icons.payments_rounded, 'Payment'),
              _buildItem(3, Icons.work_rounded, 'My Works'),
              _buildItem(4, Icons.person_rounded, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index, IconData icon, String label) {
    final isSelected = currentIndex == index;
    final color = isSelected ? CreatorColors.primary : CreatorColors.outline;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(minWidth: 56),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 23, color: color),
            const SizedBox(height: 3),
            Text(
              label,
              style: AppTextStyles.labelSm(color: color).copyWith(
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

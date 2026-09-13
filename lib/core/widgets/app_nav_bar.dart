import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'app_nav_item.dart';

/// 5-item bottom navigation bar matching the Lumina Creator platform.
class AppNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const AppNavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  static const List<_NavItemData> _items = [
    _NavItemData(icon: Icons.home_rounded, label: 'Home'),
    _NavItemData(icon: Icons.campaign_rounded, label: 'Campaigns'),
    _NavItemData(icon: Icons.forum_rounded, label: 'Messages', badge: '3'),
    _NavItemData(icon: Icons.payments_rounded, label: 'Payments'),
    _NavItemData(icon: Icons.account_circle_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite.withValues(alpha: 0.95),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, -1),
          ),
        ],
        border: const Border(
          top: BorderSide(color: Color(0xFFEFF4FF), width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              return AppNavItem(
                icon: item.icon,
                label: item.label,
                badge: item.badge,
                isSelected: currentIndex == index,
                onTap: () => onIndexChanged(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final String label;
  final String? badge;

  const _NavItemData({required this.icon, required this.label, this.badge});
}

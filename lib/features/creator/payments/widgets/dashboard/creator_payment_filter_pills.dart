import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/creator_colors.dart';

class CreatorPaymentFilterPills extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterChanged;

  const CreatorPaymentFilterPills({
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
          _buildPill('all', 'All Campaigns', count: '12'),
          const SizedBox(width: 8),
          _buildPill('escrow', 'Escrow Active', hasDot: true),
          const SizedBox(width: 8),
          _buildPill('redeem', 'Ready to Redeem', badge: '1'),
          const SizedBox(width: 8),
          _buildPill('settled', 'Settled'),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(19),
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(color: CreatorColors.surfaceContainerHigh, shape: BoxShape.circle),
              child: const Icon(Icons.tune_rounded, size: 18, color: CreatorColors.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(String key, String label, {String? count, bool hasDot = false, String? badge}) {
    final isSelected = activeFilter == key;

    return InkWell(
      onTap: () => onFilterChanged(key),
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
            if (hasDot) ...[
              Container(width: 6, height: 6, decoration: BoxDecoration(color: isSelected ? Colors.white : CreatorColors.primary, shape: BoxShape.circle)),
              const SizedBox(width: 6),
            ],
            Text(label, style: AppTextStyles.labelMd(color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant)),
            if (count != null) ...[
              const SizedBox(width: 6),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(color: isSelected ? Colors.white.withValues(alpha: 0.25) : CreatorColors.primaryFixed, shape: BoxShape.circle),
                child: Center(child: Text(count, style: AppTextStyles.labelSm(color: isSelected ? Colors.white : CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700))),
              ),
            ],
            if (badge != null) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(color: CreatorColors.primaryContainer, borderRadius: BorderRadius.circular(10)),
                child: Text(badge, style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

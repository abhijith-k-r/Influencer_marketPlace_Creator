import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class PaymentFilterChipsRow extends StatelessWidget {
  final String activeFilter;
  final ValueChanged<String> onFilterSelected;
  final VoidCallback? onExportTap;

  static const List<String> filters = [
    'All Transactions',
    'Escrow Active',
    'This Month',
    'Sneaker Drop',
  ];

  const PaymentFilterChipsRow({
    super.key,
    required this.activeFilter,
    required this.onFilterSelected,
    this.onExportTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ...filters.map((filter) {
            final isSelected = activeFilter == filter;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onFilterSelected(filter),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.onSurface
                        : AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(AppRadii.full),
                    boxShadow: AppShadows.cardSoft,
                  ),
                  child: Text(
                    filter,
                    style: AppTextStyles.labelMd(
                      color: isSelected
                          ? AppColors.surfaceContainerLowest
                          : AppColors.tertiary,
                    ),
                  ),
                ),
              ),
            );
          }),
          GestureDetector(
            onTap: onExportTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppRadii.full),
                boxShadow: AppShadows.cardSoft,
              ),
              child: Row(
                children: [
                  const Icon(Icons.file_download_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text('Export', style: AppTextStyles.labelMd(color: AppColors.onSurface)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

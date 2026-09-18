import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class PaymentSearchHistoryBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearchSubmitted;
  final VoidCallback onClear;
  final ValueChanged<String> onTagTap;

  static const List<String> recentQueries = [
    '@priya_vlogs',
    'Diwali Mega Campaign',
    '₹45,000 Milestone',
  ];

  const PaymentSearchHistoryBar({
    super.key,
    required this.controller,
    required this.onSearchSubmitted,
    required this.onClear,
    required this.onTagTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(AppRadii.xl),
            boxShadow: AppShadows.cardSoft,
          ),
          child: TextField(
            controller: controller,
            onSubmitted: onSearchSubmitted,
            style: AppTextStyles.bodySm(color: AppColors.onSurface),
            decoration: InputDecoration(
              hintText: 'Search by creator name, handle, or campaign...',
              hintStyle: AppTextStyles.bodySm(color: AppColors.tertiary),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary, size: 22),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close, size: 16, color: AppColors.tertiary),
                onPressed: onClear,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text('Recent:', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
              const SizedBox(width: 6),
              ...recentQueries.map((query) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () => onTagTap(query),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(AppRadii.full),
                        boxShadow: AppShadows.cardSoft,
                      ),
                      child: Text(
                        query,
                        style: AppTextStyles.labelSm(color: AppColors.onSurface),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

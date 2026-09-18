import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CampaignBasicInfoCard extends StatelessWidget {
  final TextEditingController titleController;
  final String selectedCategory;
  final ValueChanged<String?> onCategoryChanged;

  static const List<String> categories = [
    'Fashion & Streetwear',
    'Consumer Electronics & Tech',
    'Fitness & Active Lifestyle',
    'Beauty, Skincare & Wellness',
    'Food, Beverage & Dining',
  ];

  const CampaignBasicInfoCard({
    super.key,
    required this.titleController,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.feed_rounded, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('Campaign Details', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
            ],
          ),
          const SizedBox(height: 14),
          Text('Campaign Title', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 6),
          TextField(
            controller: titleController,
            style: AppTextStyles.bodyMd(),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.surfaceContainerLow,
              hintText: 'e.g. UrbanKicks Sneaker Gen-2 Drop',
              hintStyle: AppTextStyles.bodyMd(color: AppColors.tertiary),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.md), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 14),
          Text('Primary Category', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.md)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.onSurfaceVariant),
                items: categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat, style: AppTextStyles.bodyMd()))).toList(),
                onChanged: onCategoryChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

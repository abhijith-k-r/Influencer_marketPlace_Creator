import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Content categories selector with count badge and selectable chips (Figma).
class ContentCategoriesSelector extends StatelessWidget {
  final List<String> selectedCategories;
  final ValueChanged<String>? onCategoryToggled;

  static const List<String> allCategories = [
    'Unboxing',
    'Product Reviews',
    'Tutorials',
    'Vlogs',
    'Reels & Viral Shorts',
    'Story Takeovers',
    'Live Streams',
  ];

  const ContentCategoriesSelector({
    super.key,
    this.selectedCategories = const ['Unboxing', 'Product Reviews'],
    this.onCategoryToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Content Categories',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${selectedCategories.length} Selected',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          'Select formats you produce consistently',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allCategories.map((category) {
            final isSelected = selectedCategories.contains(category);
            return GestureDetector(
              onTap: () => onCategoryToggled?.call(category),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.buttonPrimary : AppColors.inputBackground,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  isSelected ? '$category ✓' : category,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? AppColors.surfaceWhite : AppColors.textPrimary,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

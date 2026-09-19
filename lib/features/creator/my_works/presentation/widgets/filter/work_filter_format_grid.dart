import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// 2x2 grid selector for deliverable format types (Reels, Shorts, Stories, Review).
class WorkFilterFormatGrid extends StatelessWidget {
  final Set<String> selectedFormats;
  final ValueChanged<String> onToggleFormat;

  static const List<Map<String, dynamic>> formats = [
    {'name': 'Instagram Reels', 'icon': Icons.movie_outlined},
    {'name': 'YouTube Shorts', 'icon': Icons.smart_display_outlined},
    {'name': 'Stories (3x)', 'icon': Icons.amp_stories_outlined},
    {'name': 'Dedicated Review', 'icon': Icons.reviews_outlined},
  ];

  const WorkFilterFormatGrid({super.key, required this.selectedFormats, required this.onToggleFormat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Deliverable Asset Type', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
              Text('Multi-Format', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: formats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3.2,
            ),
            itemBuilder: (context, index) {
              final item = formats[index];
              final name = item['name'] as String;
              final icon = item['icon'] as IconData;
              final isSelected = selectedFormats.contains(name);

              return InkWell(
                onTap: () => onToggleFormat(name),
                borderRadius: AppRadii.roundedMd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? CreatorColors.primary : CreatorColors.surfaceContainerLow,
                    borderRadius: AppRadii.roundedMd,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(icon, size: 18, color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                name,
                                style: AppTextStyles.labelSm(color: isSelected ? Colors.white : CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                        size: 16,
                        color: isSelected ? Colors.white : CreatorColors.surfaceContainer,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

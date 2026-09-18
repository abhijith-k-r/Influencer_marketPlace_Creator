import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CampaignStatusTabsRow extends StatelessWidget {
  final String activeTab;
  final int allCount;
  final int activeCount;
  final int completedCount;
  final int draftsCount;
  final ValueChanged<String> onTabSelected;

  const CampaignStatusTabsRow({
    super.key,
    required this.activeTab,
    required this.allCount,
    required this.activeCount,
    required this.completedCount,
    required this.draftsCount,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'key': 'all', 'label': 'All Campaigns ($allCount)'},
      {'key': 'active', 'label': 'Active ($activeCount)'},
      {'key': 'completed', 'label': 'Completed ($completedCount)'},
      {'key': 'drafts', 'label': 'Drafts ($draftsCount)'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = activeTab == tab['key'];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppRadii.full),
              onTap: () => onTabSelected(tab['key']!),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(AppRadii.full),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x080B1C30),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  tab['label']!,
                  style: AppTextStyles.labelMd(
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.tertiary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

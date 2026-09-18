import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'date_presets_row.dart';
import 'filter_date_box.dart';

class FilterDateRangeSection extends StatelessWidget {
  final String activePreset;
  final ValueChanged<String> onPresetSelected;
  final String fromDate;
  final String toDate;

  static const List<String> presets = [
    'All Time',
    'This Month',
    'Last 30 Days',
    'Q3 2024',
    'Custom',
  ];

  const FilterDateRangeSection({
    super.key,
    required this.activePreset,
    required this.onPresetSelected,
    this.fromDate = '01 Oct 2024',
    this.toDate = '24 Oct 2024',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text('Date Range', style: AppTextStyles.headlineSm()),
                ],
              ),
              Text('Oct 2024', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          DatePresetsRow(
            presets: presets,
            activePreset: activePreset,
            onPresetSelected: onPresetSelected,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilterDateBox(label: 'From', date: fromDate, icon: Icons.event),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilterDateBox(
                  label: 'To',
                  date: toDate,
                  icon: Icons.event_available,
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

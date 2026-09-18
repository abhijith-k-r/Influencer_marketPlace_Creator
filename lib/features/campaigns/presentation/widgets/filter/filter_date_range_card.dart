import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'filter_date_field.dart';

class FilterDateRangeCard extends StatelessWidget {
  final String selectedPreset;
  final String fromDate;
  final String toDate;
  final ValueChanged<String> onPresetSelected;

  static const List<String> presets = ['All Time', 'This Month', 'Last 30 Days', 'Q4 2024'];

  const FilterDateRangeCard({
    super.key,
    required this.selectedPreset,
    required this.fromDate,
    required this.toDate,
    required this.onPresetSelected,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_month_rounded, size: 20, color: AppColors.tertiary),
                  const SizedBox(width: 8),
                  Text('Date Range', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                ],
              ),
              Text('Billing & Activity', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: presets.map((p) {
                final isSel = selectedPreset == p;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () => onPresetSelected(p),
                    borderRadius: BorderRadius.circular(AppRadii.full),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSel ? AppColors.primary : AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(AppRadii.full),
                      ),
                      child: Text(p, style: AppTextStyles.labelMd(color: isSel ? AppColors.onPrimary : AppColors.tertiary)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: FilterDateField(label: 'FROM', value: fromDate, icon: Icons.event)),
              const SizedBox(width: 10),
              Expanded(child: FilterDateField(label: 'TO', value: toDate, icon: Icons.event_available)),
            ],
          ),
        ],
      ),
    );
  }
}

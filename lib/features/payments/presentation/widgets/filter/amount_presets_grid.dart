import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AmountPresetsGrid extends StatelessWidget {
  final List<String> presets;
  final String activePreset;
  final ValueChanged<String> onPresetSelected;

  const AmountPresetsGrid({
    super.key,
    required this.presets,
    required this.activePreset,
    required this.onPresetSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: presets.map((preset) {
        final isSelected = activePreset == preset;
        return GestureDetector(
          onTap: () => onPresetSelected(preset),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadii.lg),
            ),
            child: Text(
              preset,
              style: AppTextStyles.labelSm(
                color: isSelected ? Colors.white : AppColors.onSurface,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

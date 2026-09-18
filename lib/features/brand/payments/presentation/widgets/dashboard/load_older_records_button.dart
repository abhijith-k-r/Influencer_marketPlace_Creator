import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class LoadOlderRecordsButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoadOlderRecordsButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.surfaceContainer,
            foregroundColor: AppColors.onSurface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadii.xl),
            ),
          ),
          child: Text(
            'Load Older Records',
            style: AppTextStyles.labelLg(color: AppColors.onSurface),
          ),
        ),
      ),
    );
  }
}

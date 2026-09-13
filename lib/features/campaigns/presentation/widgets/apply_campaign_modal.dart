import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/features/auth/presentation/widgets/primary_button.dart';

/// Modal bottom sheet allowing creators to submit an application proposal.
class ApplyCampaignModal extends StatelessWidget {
  final String campaignTitle;
  final String brandName;

  const ApplyCampaignModal({
    super.key,
    required this.campaignTitle,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedTopLg,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Apply to $brandName', style: AppTextStyles.h1.copyWith(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            AppSpacing.verticalMd,
            Text(
              'Your verified media kit and social metrics will be securely shared with $brandName upon submission.',
              style: AppTextStyles.body,
            ),
            AppSpacing.verticalLg,
            TextField(
              maxLines: 3,
              style: AppTextStyles.fieldInput,
              decoration: InputDecoration(
                hintText: 'Add a custom pitch note to the brand (optional)...',
                hintStyle: AppTextStyles.fieldPlaceholder.copyWith(fontSize: 12),
                filled: true,
                fillColor: AppColors.inputBackground,
                border: const OutlineInputBorder(
                  borderRadius: AppRadii.roundedMd,
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            AppSpacing.verticalLg,
            PrimaryButton(
              label: 'Submit Application (\$2,500 Escrow)',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.mainShell);
              },
            ),
          ],
        ),
      ),
    );
  }
}

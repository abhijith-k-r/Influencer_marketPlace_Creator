import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../widgets/creation/campaign_creation_form_body.dart';

class BrandCampaignCreationScreen extends StatelessWidget {
  const BrandCampaignCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Create Campaign', style: AppTextStyles.headlineSm()),
        backgroundColor: AppColors.surface.withValues(alpha: 0.85),
        elevation: 0,
      ),
      body: const CampaignCreationFormBody(),
    );
  }
}

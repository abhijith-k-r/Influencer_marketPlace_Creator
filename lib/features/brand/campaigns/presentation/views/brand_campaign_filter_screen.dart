import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/filter/campaign_filter_form_body.dart';

class BrandCampaignFilterScreen extends StatelessWidget {
  const BrandCampaignFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      backgroundColor: AppColors.background,
      useSafeArea: true,
      body: CampaignFilterFormBody(),
    );
  }
}

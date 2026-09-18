import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/filter/campaign_filter_form_body.dart';

class BrandCampaignFilterScreen extends StatelessWidget {
  const BrandCampaignFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CampaignFilterFormBody(),
      ),
    );
  }
}

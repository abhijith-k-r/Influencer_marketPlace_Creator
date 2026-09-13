import 'package:flutter/material.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/application_item_model.dart';
import '../widgets/application_card.dart';
import '../widgets/application_status_tabs.dart';

/// Screen listing submitted sponsorships and their review/contract state.
class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('My Applications', style: AppTextStyles.h1.copyWith(fontSize: 20)),
        AppSpacing.verticalXs,
        Text(
          'Track status, negotiate escrow milestones, and deliver collateral.',
          style: AppTextStyles.subtitle,
        ),
        AppSpacing.verticalLg,
        ApplicationStatusTabs(selectedTab: 'All', onTabChanged: (_) {}),
        AppSpacing.verticalLg,
        ...ApplicationItemModel.sampleApplications.map(
          (app) => ApplicationCard(application: app),
        ),
        AppSpacing.verticalXl,
      ],
    );
  }
}

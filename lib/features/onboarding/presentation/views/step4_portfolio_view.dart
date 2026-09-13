import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/external_portfolio_hubs_card.dart';
import '../widgets/portfolio_overview_bento.dart';
import '../widgets/step4_action_buttons.dart';
import '../widgets/step4_portfolio_header.dart';
import '../widgets/step4_progress_header.dart';
import '../widgets/talent_quality_callout.dart';
import '../widgets/verified_campaigns_section.dart';

/// Step 4 of 5: Experience & Portfolio matching Figma 2:818 and exact HTML specs.
class Step4PortfolioView extends StatelessWidget {
  const Step4PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Step4ProgressHeader(),
          const SizedBox(height: 16),
          const Step4PortfolioHeader(),
          const SizedBox(height: 16),
          const PortfolioOverviewBento(),
          const SizedBox(height: 16),
          const VerifiedCampaignsSection(),
          const SizedBox(height: 16),
          const ExternalPortfolioHubsCard(),
          const SizedBox(height: 16),
          const TalentQualityCallout(),
          const SizedBox(height: 20),
          Step4ActionButtons(
            onBack: () => Navigator.pop(context),
            onContinue: () {
              Navigator.pushNamed(context, AppRoutes.onboardingStep5);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/review_overview_card.dart';
import '../widgets/review_perk_banner.dart';
import '../widgets/step5_action_buttons.dart';
import '../widgets/step5_progress_banner.dart';
import '../widgets/step5_title_area.dart';

/// Step 5 of 5: Profile Review matching Figma 2:1018 and exact HTML specs.
class Step5ReviewView extends StatelessWidget {
  const Step5ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Step5ProgressBanner(),
          const SizedBox(height: 16),
          const Step5TitleArea(),
          const SizedBox(height: 16),
          ReviewOverviewCard(
            onEditProfile: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingStep1),
            onEditBio: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingStep1),
            onEditReach: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingStep3),
            onEditPortfolio: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingStep4),
            onEditDeliverables: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingStep2),
          ),
          const SizedBox(height: 16),
          const ReviewPerkBanner(),
          const SizedBox(height: 20),
          Step5ActionButtons(
            onBack: () => Navigator.pop(context),
            onSubmit: () {
              Navigator.pushReplacementNamed(context, AppRoutes.verification);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

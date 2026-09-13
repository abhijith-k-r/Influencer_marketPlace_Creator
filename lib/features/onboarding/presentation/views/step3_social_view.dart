import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/connected_reach_summary_card.dart';
import '../widgets/social_analytics_banner.dart';
import '../widgets/social_platforms_card.dart';
import '../widgets/social_privacy_tip_box.dart';
import '../widgets/step3_action_buttons.dart';
import '../widgets/step3_progress_header.dart';
import '../widgets/step3_title_section.dart';

/// Step 3 of 5: Social Media Connection matching Figma 2:661.
class Step3SocialView extends StatelessWidget {
  const Step3SocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Step3ProgressHeader(),
          const SizedBox(height: 20),
          const Step3TitleSection(),
          const SizedBox(height: 16),
          const SocialAnalyticsBanner(),
          const SizedBox(height: 16),
          const ConnectedReachSummaryCard(),
          const SizedBox(height: 16),
          const SocialPlatformsCard(),
          const SizedBox(height: 16),
          const SocialPrivacyTipBox(),
          const SizedBox(height: 20),
          Step3ActionButtons(
            onBack: () => Navigator.pop(context),
            onContinue: () {
              Navigator.pushNamed(context, AppRoutes.onboardingStep4);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

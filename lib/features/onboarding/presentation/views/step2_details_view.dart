import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/ai_matchmaker_banner.dart';
import '../widgets/content_niche_card.dart';
import '../widgets/creator_bio_section.dart';
import '../widgets/creator_privacy_tip_box.dart';
import '../widgets/preferred_deliverables_list.dart';
import '../widgets/step2_action_buttons.dart';
import '../widgets/step2_progress_header.dart';
import '../widgets/step2_title_section.dart';

/// Step 2 of 5: Profile Setup – Creator Details matching Figma 2:376.
class Step2DetailsView extends StatelessWidget {
  const Step2DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Step2ProgressHeader(),
          const SizedBox(height: 20),
          const Step2TitleSection(),
          const SizedBox(height: 16),
          const AiMatchmakerBanner(),
          const SizedBox(height: 16),
          const CreatorBioSection(),
          const SizedBox(height: 16),
          const ContentNicheCard(),
          const SizedBox(height: 16),
          const PreferredDeliverablesList(),
          const SizedBox(height: 16),
          const CreatorPrivacyTipBox(),
          const SizedBox(height: 20),
          Step2ActionButtons(
            onBack: () => Navigator.pop(context),
            onContinue: () {
              Navigator.pushNamed(context, AppRoutes.onboardingStep3);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

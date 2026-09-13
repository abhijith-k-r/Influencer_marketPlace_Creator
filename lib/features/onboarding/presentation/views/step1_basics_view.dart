import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/profile_basics_card.dart';
import '../widgets/profile_basics_footer.dart';
import '../widgets/profile_basics_header.dart';
import '../widgets/profile_basics_progress.dart';

/// Step 1 of 5: Profile Setup – Basic matching Figma 2:162.
class Step1BasicsView extends StatelessWidget {
  const Step1BasicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ProfileBasicsProgress(),
          const SizedBox(height: 24),
          const ProfileBasicsHeader(),
          const SizedBox(height: 24),
          ProfileBasicsCard(
            onContinue: () {
              Navigator.pushNamed(context, AppRoutes.onboardingStep2);
            },
            onSaveLater: () {
              Navigator.pushNamed(context, AppRoutes.mainShell);
            },
          ),
          const SizedBox(height: 24),
          const ProfileBasicsFooter(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

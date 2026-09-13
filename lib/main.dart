import 'package:flutter/material.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/views/signin_screen.dart';
import 'features/auth/presentation/views/signup_screen.dart';
import 'features/campaigns/data/models/campaign_model.dart';
import 'features/campaigns/presentation/views/campaign_details_screen.dart';
import 'features/home/presentation/views/main_navigation_shell.dart';
import 'features/onboarding/presentation/views/step1_basics_view.dart';
import 'features/onboarding/presentation/views/step2_details_view.dart';
import 'features/onboarding/presentation/views/step3_social_view.dart';
import 'features/onboarding/presentation/views/step4_portfolio_view.dart';
import 'features/onboarding/presentation/views/step5_review_view.dart';
import 'features/onboarding/presentation/views/verification_status_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CreatorApp());
}

/// Root widget of the Creator Application with complete navigation routes.
class CreatorApp extends StatelessWidget {
  const CreatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creator Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.signup,
      routes: {
        AppRoutes.signup: (_) => const SignupScreen(),
        AppRoutes.signin: (_) => const SigninScreen(),
        AppRoutes.onboardingStep1: (_) => const Step1BasicsView(),
        AppRoutes.onboardingStep2: (_) => const Step2DetailsView(),
        AppRoutes.onboardingStep3: (_) => const Step3SocialView(),
        AppRoutes.onboardingStep4: (_) => const Step4PortfolioView(),
        AppRoutes.onboardingStep5: (_) => const Step5ReviewView(),
        AppRoutes.verification: (_) => const VerificationStatusView(),
        AppRoutes.mainShell: (_) => const MainNavigationShell(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.campaignDetails) {
          final campaign = settings.arguments as CampaignModel?;
          return MaterialPageRoute(
            builder: (_) => CampaignDetailsScreen(campaign: campaign),
          );
        }
        return null;
      },
    );
  }
}

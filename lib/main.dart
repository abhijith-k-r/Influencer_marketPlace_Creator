import 'package:flutter/material.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/views/signin_screen.dart';
import 'features/auth/presentation/views/signup_screen.dart';
import 'features/campaigns/data/models/campaign_model.dart';
import 'features/campaigns/presentation/views/campaign_details_screen.dart';
import 'features/home/presentation/views/main_navigation_shell.dart';
import 'features/messages/data/models/message_thread_model.dart';
import 'features/messages/presentation/views/creator_message_screen.dart';
import 'features/messages/presentation/views/messages_inbox_screen.dart';
import 'features/onboarding/presentation/views/step1_basics_view.dart';
import 'features/onboarding/presentation/views/step2_details_view.dart';
import 'features/onboarding/presentation/views/step3_social_view.dart';
import 'features/onboarding/presentation/views/step4_portfolio_view.dart';
import 'features/onboarding/presentation/views/step5_review_view.dart';
import 'features/onboarding/presentation/views/verification_status_view.dart';
import 'features/payments/presentation/views/payments_screen.dart';
import 'features/payments/presentation/views/request_payment_screen.dart';
import 'features/profile/presentation/views/creator_profile_screen.dart';

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
        AppRoutes.messages: (_) => const MessagesInboxScreen(),
        AppRoutes.chatDetail: (_) => const CreatorMessageScreen(),
        AppRoutes.payments: (_) => const PaymentsScreen(),
        AppRoutes.requestPayment: (_) => const RequestPaymentScreen(),
        AppRoutes.creatorProfile: (_) => const CreatorProfileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.campaignDetails) {
          final campaign = settings.arguments as CampaignModel?;
          return MaterialPageRoute(
            builder: (_) => CampaignDetailsScreen(campaign: campaign),
          );
        }
        if (settings.name == AppRoutes.chatDetail) {
          final thread = settings.arguments as MessageThreadModel?;
          return MaterialPageRoute(
            builder: (_) => CreatorMessageScreen(thread: thread),
          );
        }
        return null;
      },
    );
  }
}

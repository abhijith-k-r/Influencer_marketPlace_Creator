import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/main.dart';
import 'package:creator_side/core/constants/app_strings.dart';
import 'package:creator_side/features/home/presentation/views/main_navigation_shell.dart';
import 'package:creator_side/features/onboarding/presentation/views/step1_basics_view.dart';
import 'package:creator_side/features/onboarding/presentation/views/step2_details_view.dart';
import 'package:creator_side/features/onboarding/presentation/views/step3_social_view.dart';
import 'package:creator_side/features/onboarding/presentation/views/step4_portfolio_view.dart';
import 'package:creator_side/features/onboarding/presentation/views/step5_review_view.dart';
import 'package:creator_side/features/onboarding/presentation/views/verification_status_view.dart';

void main() {
  testWidgets('SignupScreen renders and navigates to Sign In', (tester) async {
    await tester.pumpWidget(const CreatorApp());
    await tester.pump();
    expect(find.text(AppStrings.signupTitle), findsOneWidget);
    expect(find.text(AppStrings.createAccount), findsOneWidget);

    await tester.drag(find.byType(SingleChildScrollView).first, const Offset(0, -400));
    await tester.pumpAndSettle();

    await tester.tap(find.text(AppStrings.signIn));
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.signinTitle), findsOneWidget);
  });

  testWidgets('Onboarding Step 1 renders correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Step1BasicsView()));
    await tester.pump();
    expect(find.text('Complete your creator profile'), findsOneWidget);
    expect(find.text('STEP 1 OF 5'), findsOneWidget);
  });

  testWidgets('Onboarding Step 2 renders Creator Details correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Step2DetailsView()));
    await tester.pump();
    expect(find.text('Tell us about your content'), findsOneWidget);
    expect(find.text('STEP 2 OF 5'), findsOneWidget);
  });

  testWidgets('Onboarding Step 3 renders Social Connection correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Step3SocialView()));
    await tester.pump();
    expect(find.text('Connect your social channels'), findsOneWidget);
    expect(find.text('STEP 3 OF 5'), findsOneWidget);
  });

  testWidgets('Onboarding Step 4 renders Portfolio correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Step4PortfolioView()));
    await tester.pump();
    expect(find.text('Show your previous work'), findsOneWidget);
    expect(find.text('STEP 4 OF 5 • PORTFOLIO'), findsOneWidget);
    expect(find.text('Verified Campaigns'), findsOneWidget);
    expect(find.text('Sony Audio'), findsOneWidget);
    expect(find.text('Nordic Watch Co.'), findsOneWidget);
    expect(find.text('External Portfolio Hubs'), findsOneWidget);
  });

  testWidgets('Onboarding Step 5 renders Profile Review correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Step5ReviewView()));
    await tester.pump();
    expect(find.text('Review your profile'), findsOneWidget);
    expect(find.text('STEP 5 OF 5'), findsOneWidget);
    expect(find.text('Alex Morgan'), findsOneWidget);
    expect(find.text('TOTAL AGGREGATED REACH'), findsOneWidget);
    expect(find.text('437,000+'), findsOneWidget);
    expect(find.text('Verified Creator Perk'), findsOneWidget);
    expect(find.text('Complete Profile'), findsOneWidget);
  });

  testWidgets('Creator Verification screen renders correctly', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: VerificationStatusView()));
    await tester.pump();
    expect(find.text('Verify your creator account'), findsOneWidget);
    expect(find.text('Profile verification in progress'), findsOneWidget);
    expect(find.text('Verification Checklist'), findsOneWidget);
    expect(find.text('What happens next?'), findsOneWidget);
    expect(find.text('Check Verification Status'), findsOneWidget);
    expect(find.text('Back to Profile'), findsOneWidget);
  });

  testWidgets('Main Navigation Shell renders Dashboard and tabs', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainNavigationShell()));
    await tester.pump();
    expect(find.text('Good morning, Alex 👋'), findsOneWidget);
    expect(find.text('Marketplace Pulse'), findsOneWidget);
  });
}

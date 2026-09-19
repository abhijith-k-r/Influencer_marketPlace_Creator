import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/core/constants/app_route_map.dart';
import 'package:creator_side/features/creator/payments/presentation/views/creator_payment_details_view.dart';
import 'package:creator_side/features/creator/payments/presentation/views/creator_payment_redeem_view.dart';
import 'package:creator_side/features/creator/payments/presentation/views/creator_payments_view.dart';
import 'package:creator_side/features/creator/payments/presentation/widgets/dashboard/creator_campaign_earning_card.dart';

void main() {
  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      routes: appRouteMap,
      home: child,
    );
  }

  testWidgets('CreatorPaymentsView renders dashboard elements and filters', (tester) async {
    tester.view.physicalSize = const Size(800, 1800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(buildTestableWidget(const CreatorPaymentsView()));
    await tester.pump();

    expect(find.text('Studio'), findsOneWidget);
    expect(find.text('Payment'), findsOneWidget);
    expect(find.text('BALANCE OVERVIEW'), findsOneWidget);
    expect(find.text('TOTAL EARNINGS'), findsOneWidget);
    expect(find.text('All Campaigns'), findsOneWidget);
    expect(find.byType(CreatorCampaignEarningCard), findsWidgets);

    // Tap filter
    await tester.tap(find.text('Settled'));
    await tester.pump();
    expect(find.byType(CreatorCampaignEarningCard), findsWidgets);
  });

  testWidgets('CreatorPaymentDetailsView renders milestone and overview', (tester) async {
    tester.view.physicalSize = const Size(800, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(buildTestableWidget(const CreatorPaymentDetailsView()));
    await tester.pump();

    expect(find.text('Payment Details'), findsOneWidget);
    expect(find.text('Milestones & Bonuses'), findsOneWidget);
    expect(find.text('Settlement History'), findsOneWidget);
    expect(find.text('HDFC Bank ••4021'), findsOneWidget);
  });

  testWidgets('CreatorPaymentRedeemView renders redeem flow elements', (tester) async {
    tester.view.physicalSize = const Size(800, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(buildTestableWidget(const CreatorPaymentRedeemView()));
    await tester.pump();

    expect(find.text('Redeem Milestone Payout'), findsOneWidget);
    expect(find.text('AMOUNT READY TO DISBURSE'), findsOneWidget);
    expect(find.text('₹2,000.00'), findsWidgets);
    expect(find.text('Destination Account'), findsOneWidget);
    expect(find.text('Payout Summary'), findsOneWidget);
    expect(find.text('Confirm Redeem • ₹1,980.00'), findsOneWidget);
  });
}

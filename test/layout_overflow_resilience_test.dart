import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/features/splash/presentation/widgets/splash_footer.dart';
import 'package:creator_side/features/creator/home/presentation/widgets/creator_pulse_toast_row.dart';
import 'package:creator_side/features/creator/home/presentation/widgets/creator_opportunity_matrix_panel.dart';
import 'package:creator_side/features/creator/home/data/models/mock_creator_opportunities.dart';
import 'package:creator_side/features/creator/messages/presentation/widgets/creator_escrow_anchor_banner.dart';
import 'package:creator_side/features/brand/payments/presentation/widgets/dashboard/transaction_milestone_strip.dart';
import 'package:creator_side/features/brand/payments/presentation/widgets/dashboard/payment_transaction_tile.dart';
import 'package:creator_side/features/brand/payments/data/datasources/mock_payment_data.dart';
import 'package:creator_side/features/brand/payments/data/models/payment_transaction_model.dart';

void main() {
  testWidgets('Widgets do not overflow at width 330 with 1.15x text scale', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.8;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final tx = MockPaymentData.transactions.first;
    final safeTx = PaymentTransactionModel(
      id: tx.id,
      paymentId: tx.paymentId,
      creatorName: tx.creatorName,
      creatorAvatar: '', // Empty to use fallback icon and avoid NetworkImage 400 in test
      campaignTitle: tx.campaignTitle,
      milestoneDescription: tx.milestoneDescription,
      amount: tx.amount,
      status: tx.status,
      paymentType: tx.paymentType,
      dateText: tx.dateText,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            textScaler: TextScaler.linear(1.15),
            size: Size(330, 800),
          ),
          child: Scaffold(
            body: SizedBox(
              width: 330.0,
              child: ListView(
                children: [
                  const SplashFooter(),
                  const CreatorPulseToastRow(),
                  CreatorOpportunityMatrixPanel(
                    opportunity: mockCreatorOpportunities.first,
                  ),
                  CreatorEscrowAnchorBanner(
                    amount: '₹45,000',
                    status: 'Escrow Deposited • Milestone 2/3',
                    onDetailsTap: () {},
                  ),
                  const TransactionMilestoneStrip(
                    milestoneDescription: 'Complete Instagram Reel Deliverable with brand review',
                    dateText: 'Oct 24, 2026',
                  ),
                  PaymentTransactionTile(
                    transaction: safeTx,
                    onTap: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}

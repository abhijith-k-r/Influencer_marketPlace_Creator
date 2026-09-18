import '../models/payment_milestone_model.dart';

abstract final class MockPaymentMilestones {
  static const List<PaymentMilestoneModel> aaravMilestones = [
    PaymentMilestoneModel(
      stepNumber: 1,
      title: 'Script & Concept Sign-off',
      amount: 15000,
      status: MilestoneStepStatus.completed,
      dateDescription: 'Released on Oct 18, 2024',
    ),
    PaymentMilestoneModel(
      stepNumber: 2,
      title: 'Draft Reel Video Approval',
      amount: 25000,
      status: MilestoneStepStatus.current,
      dateDescription: 'Released Today via Escrow Protocol',
    ),
    PaymentMilestoneModel(
      stepNumber: 3,
      title: 'Final Live Link & 24h Metrics',
      amount: 10000,
      status: MilestoneStepStatus.locked,
      dateDescription: 'Locked in Protected Vault Escrow',
    ),
  ];
}

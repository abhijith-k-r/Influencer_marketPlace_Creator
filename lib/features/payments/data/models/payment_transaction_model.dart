import 'payment_milestone_model.dart';

enum PaymentTransactionStatus {
  paid,
  pendingEscrow,
  underReview,
  failed,
  disputed,
}

enum PaymentType {
  initialAdvance,
  milestoneRelease,
  finalPayout,
  performanceBonus,
  refund,
}

class PaymentTransactionModel {
  final String id;
  final String paymentId;
  final String creatorName;
  final String? creatorHandle;
  final String creatorAvatar;
  final String campaignTitle;
  final String milestoneDescription;
  final double amount;
  final double totalCampaignAmount;
  final double escrowRemaining;
  final PaymentTransactionStatus status;
  final PaymentType paymentType;
  final String dateText;
  final String paidTimestampText;
  final String paymentMethod;
  final String paymentMethodDetail;
  final String bankUtrId;
  final String billedOrg;
  final String gstin;
  final double platformFee;
  final double tdsAmount;
  final List<PaymentMilestoneModel> milestones;

  const PaymentTransactionModel({
    required this.id,
    required this.paymentId,
    required this.creatorName,
    this.creatorHandle,
    required this.creatorAvatar,
    required this.campaignTitle,
    required this.milestoneDescription,
    required this.amount,
    this.totalCampaignAmount = 50000.0,
    this.escrowRemaining = 10000.0,
    required this.status,
    required this.paymentType,
    required this.dateText,
    this.paidTimestampText = 'Paid on Oct 24, 2024 at 10:35 AM IST',
    this.paymentMethod = 'HDFC Corporate UPI',
    this.paymentMethodDetail = 'urbankicks@hdfcbank',
    this.bankUtrId = 'UTR3928174920419',
    this.billedOrg = 'UrbanKicks Studio Pvt Ltd',
    this.gstin = '27AABCU1234F1Z5',
    this.platformFee = 0.0,
    this.tdsAmount = 250.0,
    this.milestones = const [],
  });

  double get netAmount => amount - tdsAmount;
  bool get isPaid => status == PaymentTransactionStatus.paid;
  bool get isPendingEscrow => status == PaymentTransactionStatus.pendingEscrow;
  bool get isFailed => status == PaymentTransactionStatus.failed;
}

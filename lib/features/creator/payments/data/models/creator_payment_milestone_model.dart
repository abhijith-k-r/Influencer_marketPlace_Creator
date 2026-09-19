enum CreatorMilestoneStatus { readyToRedeem, escrowLocked, paidOut, inReview }

class CreatorPaymentMilestoneModel {
  final String id;
  final String phaseLabel;
  final String title;
  final String? subtitle;
  final String amount;
  final bool isReleased;
  final bool isAvailableToRedeem;
  final bool isLocked;
  final String? settledDateNote;
  final double? progressRatio;
  final String? progressNote;
  final String? lockNote;

  const CreatorPaymentMilestoneModel({
    required this.id,
    required this.phaseLabel,
    required this.title,
    this.subtitle,
    required this.amount,
    this.isReleased = false,
    this.isAvailableToRedeem = false,
    this.isLocked = false,
    this.settledDateNote,
    this.progressRatio,
    this.progressNote,
    this.lockNote,
  });

  bool get isRedeemable => isAvailableToRedeem;
  String get description => subtitle ?? settledDateNote ?? progressNote ?? lockNote ?? phaseLabel;

  CreatorMilestoneStatus get status {
    if (isAvailableToRedeem) return CreatorMilestoneStatus.readyToRedeem;
    if (isReleased) return CreatorMilestoneStatus.paidOut;
    if (isLocked) return CreatorMilestoneStatus.escrowLocked;
    return CreatorMilestoneStatus.inReview;
  }
}

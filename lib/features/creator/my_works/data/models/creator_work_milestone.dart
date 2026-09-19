/// Represents a financial payment milestone within a campaign deal.
class CreatorWorkMilestone {
  final String title;
  final String subtitle;
  final String amount;
  final bool isReleased;
  final bool isEscrowLocked;

  const CreatorWorkMilestone({
    required this.title,
    required this.subtitle,
    required this.amount,
    this.isReleased = false,
    this.isEscrowLocked = false,
  });
}

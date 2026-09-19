/// Represents a milestone deliverable for a creator campaign.
class CreatorWorkDeliverable {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isPending;
  final String? dueDateText;

  const CreatorWorkDeliverable({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isPending = false,
    this.dueDateText,
  });
}

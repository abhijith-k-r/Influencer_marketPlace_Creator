import 'creator_work_deliverable.dart';
import 'creator_work_milestone.dart';

/// Pre-populated mock deliverables and milestones for work details screen.
abstract final class MockCreatorWorkDetailsData {
  static const List<CreatorWorkDeliverable> deliverables = [
    CreatorWorkDeliverable(
      title: 'Concept & 30s Script Treatment',
      subtitle: 'Signed off on Oct 18 • Approved',
      isCompleted: true,
    ),
    CreatorWorkDeliverable(
      title: '1x 45s Instagram Reel (4K 60fps)',
      subtitle: 'Video Approved by brand',
      isCompleted: true,
    ),
    CreatorWorkDeliverable(
      title: '2x Story Frames with Swipe-up Link',
      subtitle: 'Due in 4 days • Pending Post',
      isCompleted: false,
      isPending: true,
      dueDateText: 'Due in 4 days',
    ),
  ];

  static const List<CreatorWorkMilestone> milestones = [
    CreatorWorkMilestone(
      title: '1. Concept & Script Sign-off',
      subtitle: 'Released direct to HDFC Bank',
      amount: '₹15,000',
      isReleased: true,
    ),
    CreatorWorkMilestone(
      title: '2. Draft Reel Video Approval',
      subtitle: 'Released on Oct 24',
      amount: '₹25,000',
      isReleased: true,
    ),
    CreatorWorkMilestone(
      title: '3. Final Live Link & 24h Metrics',
      subtitle: 'Awaiting story frames upload',
      amount: '₹10,000',
      isEscrowLocked: true,
    ),
  ];
}

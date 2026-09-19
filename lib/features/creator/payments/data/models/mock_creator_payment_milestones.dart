import 'creator_payment_milestone_model.dart';

const List<CreatorPaymentMilestoneModel> mockCreatorPaymentMilestones = [
  CreatorPaymentMilestoneModel(
    id: 'ms-1',
    phaseLabel: 'Phase 1 • Deliverable',
    title: 'Concept & Script Sign-off',
    amount: '₹15,000',
    isReleased: true,
    settledDateNote: 'Settled on Oct 18, 2024 via UPI',
  ),
  CreatorPaymentMilestoneModel(
    id: 'ms-2',
    phaseLabel: 'Growth Milestone',
    title: '50K Views Target Reached',
    subtitle: 'Target met with 54,210 verified impressions',
    amount: '₹2,000',
    isAvailableToRedeem: true,
  ),
  CreatorPaymentMilestoneModel(
    id: 'ms-3',
    phaseLabel: 'Phase 2 • Production',
    title: 'Draft Reel Video Approval',
    amount: '₹25,000',
    isReleased: true,
    settledDateNote: 'Settled on Oct 24, 2024',
  ),
  CreatorPaymentMilestoneModel(
    id: 'ms-4',
    phaseLabel: 'Bonus Tier 1',
    title: '100K Views Target',
    amount: '₹2,000',
    isLocked: true,
    progressRatio: 0.784,
    progressNote: '78,400 / 100,000 views',
  ),
  CreatorPaymentMilestoneModel(
    id: 'ms-5',
    phaseLabel: 'Bonus Tier 2',
    title: '500K Views Viral Bonus',
    amount: '₹5,000',
    isLocked: true,
    lockNote: 'Reaches after 100k unlock',
  ),
  CreatorPaymentMilestoneModel(
    id: 'ms-6',
    phaseLabel: 'Super Milestone',
    title: '1M Views Mega Reach Bonus',
    amount: '₹10,000',
    isLocked: true,
    lockNote: 'Peak Creator Tier',
  ),
];

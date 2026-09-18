enum MilestoneStepStatus {
  completed,
  current,
  locked,
}

class PaymentMilestoneModel {
  final int stepNumber;
  final String title;
  final double amount;
  final MilestoneStepStatus status;
  final String dateDescription;
  final String? subtitle;

  const PaymentMilestoneModel({
    required this.stepNumber,
    required this.title,
    required this.amount,
    required this.status,
    required this.dateDescription,
    this.subtitle,
  });

  bool get isCompleted => status == MilestoneStepStatus.completed;
  bool get isCurrent => status == MilestoneStepStatus.current;
  bool get isLocked => status == MilestoneStepStatus.locked;
}

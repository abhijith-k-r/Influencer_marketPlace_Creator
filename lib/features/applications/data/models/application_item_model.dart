import 'package:equatable/equatable.dart';

enum ApplicationStatus { inReview, accepted, completed, rejected }

/// Data model representing a submitted creator sponsorship application.
class ApplicationItemModel extends Equatable {
  final String id;
  final String brandName;
  final String campaignTitle;
  final String proposedRate;
  final String submittedDate;
  final ApplicationStatus status;

  const ApplicationItemModel({
    required this.id,
    required this.brandName,
    required this.campaignTitle,
    required this.proposedRate,
    required this.submittedDate,
    required this.status,
  });

  static const List<ApplicationItemModel> sampleApplications = [
    ApplicationItemModel(
      id: 'app-1',
      brandName: 'Sony Audio',
      campaignTitle: 'Flagship ANC Headphones Creator Showcase',
      proposedRate: '\$2,500',
      submittedDate: 'Yesterday',
      status: ApplicationStatus.inReview,
    ),
    ApplicationItemModel(
      id: 'app-2',
      brandName: 'Anker Innovations',
      campaignTitle: 'GaNPrime Fast Charger Ecosystem',
      proposedRate: '\$1,800',
      submittedDate: '3 days ago',
      status: ApplicationStatus.accepted,
    ),
    ApplicationItemModel(
      id: 'app-3',
      brandName: 'Nord Security',
      campaignTitle: 'Cybersecurity Month Sponsorship',
      proposedRate: '\$2,200',
      submittedDate: 'Sep 10',
      status: ApplicationStatus.completed,
    ),
    ApplicationItemModel(
      id: 'app-4',
      brandName: 'Logitech',
      campaignTitle: 'Ergonomic Desk Setup Campaign',
      proposedRate: '\$1,200',
      submittedDate: 'Sep 05',
      status: ApplicationStatus.inReview,
    ),
  ];

  @override
  List<Object?> get props => [
    id,
    brandName,
    campaignTitle,
    proposedRate,
    submittedDate,
    status,
  ];
}

import 'package:equatable/equatable.dart';

enum ApplicantStatus { approved, inNegotiation, pending }

class CampaignCreatorApplicantModel extends Equatable {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isVerified;
  final int fitPercentage;
  final ApplicantStatus status;

  const CampaignCreatorApplicantModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isVerified = true,
    this.fitPercentage = 90,
    this.status = ApplicantStatus.pending,
  });

  CampaignCreatorApplicantModel copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    bool? isVerified,
    int? fitPercentage,
    ApplicantStatus? status,
  }) {
    return CampaignCreatorApplicantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isVerified: isVerified ?? this.isVerified,
      fitPercentage: fitPercentage ?? this.fitPercentage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        isVerified,
        fitPercentage,
        status,
      ];
}

import 'package:equatable/equatable.dart';

class BrandProfileModel extends Equatable {
  final String name;
  final String companyName;
  final String categorySubtitle;
  final String email;
  final String phone;
  final List<String> nicheTags;
  final String productDetails;
  final String bio;
  final List<String> socialChannels;
  final String website;
  final int campaignCount;
  final double creatorScore;
  final int escrowSafePercent;
  final bool autoDisbursementEnabled;

  const BrandProfileModel({
    required this.name,
    required this.companyName,
    required this.categorySubtitle,
    required this.email,
    required this.phone,
    required this.nicheTags,
    required this.productDetails,
    required this.bio,
    required this.socialChannels,
    required this.website,
    required this.campaignCount,
    required this.creatorScore,
    required this.escrowSafePercent,
    this.autoDisbursementEnabled = true,
  });

  BrandProfileModel copyWith({
    String? name,
    String? companyName,
    String? categorySubtitle,
    String? email,
    String? phone,
    List<String>? nicheTags,
    String? productDetails,
    String? bio,
    List<String>? socialChannels,
    String? website,
    int? campaignCount,
    double? creatorScore,
    int? escrowSafePercent,
    bool? autoDisbursementEnabled,
  }) {
    return BrandProfileModel(
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      categorySubtitle: categorySubtitle ?? this.categorySubtitle,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nicheTags: nicheTags ?? this.nicheTags,
      productDetails: productDetails ?? this.productDetails,
      bio: bio ?? this.bio,
      socialChannels: socialChannels ?? this.socialChannels,
      website: website ?? this.website,
      campaignCount: campaignCount ?? this.campaignCount,
      creatorScore: creatorScore ?? this.creatorScore,
      escrowSafePercent: escrowSafePercent ?? this.escrowSafePercent,
      autoDisbursementEnabled:
          autoDisbursementEnabled ?? this.autoDisbursementEnabled,
    );
  }

  @override
  List<Object?> get props => [
        name,
        companyName,
        categorySubtitle,
        email,
        phone,
        nicheTags,
        productDetails,
        bio,
        socialChannels,
        website,
        campaignCount,
        creatorScore,
        escrowSafePercent,
        autoDisbursementEnabled,
      ];
}

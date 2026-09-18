import 'package:equatable/equatable.dart';

enum PlatformType { instagram, youtube, tiktok }

class CreatorModel extends Equatable {
  final String id;
  final String name;
  final String niche;
  final String avatarUrl;
  final bool isOnline;
  final bool isVerified;
  final PlatformType platform;
  final String followersCount;
  final String engagementRate;
  final int matchPercentage;
  final String priceStarting;

  const CreatorModel({
    required this.id,
    required this.name,
    required this.niche,
    required this.avatarUrl,
    this.isOnline = true,
    this.isVerified = true,
    required this.platform,
    required this.followersCount,
    required this.engagementRate,
    required this.matchPercentage,
    required this.priceStarting,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        niche,
        avatarUrl,
        isOnline,
        isVerified,
        platform,
        followersCount,
        engagementRate,
        matchPercentage,
        priceStarting,
      ];
}

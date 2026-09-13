import 'package:equatable/equatable.dart';

/// Data model encapsulating all creator onboarding form data across steps 1-5.
class CreatorOnboardingModel extends Equatable {
  // Step 1: Basics
  final String brandName;
  final String bio;
  final String location;
  final String language;

  // Step 2: Creator Details & Niche
  final List<String> niches;
  final List<String> contentFormats;
  final String targetAudience;
  final String baseRate;

  // Step 3: Social Media
  final Map<String, String> socialHandles; // 'YouTube': '@alex_vlogs', etc.
  final Map<String, String> followerCounts;

  // Step 4: Experience & Portfolio
  final List<String> pastBrands;
  final List<String> portfolioLinks;

  // Step 5: Consent
  final bool termsAgreed;

  const CreatorOnboardingModel({
    this.brandName = 'Alex Morgan Studios',
    this.bio =
        'Tech reviewer and lifestyle content creator exploring next-gen gadgets.',
    this.location = 'United States',
    this.language = 'English',
    this.niches = const ['Technology', 'Lifestyle', 'Gaming'],
    this.contentFormats = const ['Shorts / Reels', 'Long-form Review'],
    this.targetAudience = '18-34 Tech Enthusiasts',
    this.baseRate = '\$1,500',
    this.socialHandles = const {
      'YouTube': '@AlexMorganTech',
      'Instagram': '@alexmorgan.official',
      'TikTok': '@alexmorgan.tech',
    },
    this.followerCounts = const {
      'YouTube': '240K',
      'Instagram': '180K',
      'TikTok': '520K',
    },
    this.pastBrands = const ['Sony', 'NordVPN', 'Logitech', 'Anker'],
    this.portfolioLinks = const [
      'https://youtube.com/watch?v=sample1',
      'https://instagram.com/p/sample2',
    ],
    this.termsAgreed = true,
  });

  CreatorOnboardingModel copyWith({
    String? brandName,
    String? bio,
    String? location,
    String? language,
    List<String>? niches,
    List<String>? contentFormats,
    String? targetAudience,
    String? baseRate,
    Map<String, String>? socialHandles,
    Map<String, String>? followerCounts,
    List<String>? pastBrands,
    List<String>? portfolioLinks,
    bool? termsAgreed,
  }) {
    return CreatorOnboardingModel(
      brandName: brandName ?? this.brandName,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      language: language ?? this.language,
      niches: niches ?? this.niches,
      contentFormats: contentFormats ?? this.contentFormats,
      targetAudience: targetAudience ?? this.targetAudience,
      baseRate: baseRate ?? this.baseRate,
      socialHandles: socialHandles ?? this.socialHandles,
      followerCounts: followerCounts ?? this.followerCounts,
      pastBrands: pastBrands ?? this.pastBrands,
      portfolioLinks: portfolioLinks ?? this.portfolioLinks,
      termsAgreed: termsAgreed ?? this.termsAgreed,
    );
  }

  @override
  List<Object?> get props => [
    brandName,
    bio,
    location,
    language,
    niches,
    contentFormats,
    targetAudience,
    baseRate,
    socialHandles,
    followerCounts,
    pastBrands,
    portfolioLinks,
    termsAgreed,
  ];
}

/// Model representing creator profile details, stats, bio, and platforms.
class CreatorProfileData {
  final String name;
  final String handle;
  final String tagline;
  final String reach;
  final String rating;
  final String collabs;
  final String bio;
  final String networkTotal;
  final String instagramFollowers;
  final String youtubeFollowers;
  final String threadsFollowers;
  final String email;
  final String phone;
  final String niche;
  final String? avatarUrl;

  const CreatorProfileData({
    required this.name,
    required this.handle,
    required this.tagline,
    required this.reach,
    required this.rating,
    required this.collabs,
    required this.bio,
    required this.networkTotal,
    required this.instagramFollowers,
    required this.youtubeFollowers,
    required this.threadsFollowers,
    required this.email,
    required this.phone,
    required this.niche,
    this.avatarUrl,
  });
}

/// Portfolio item for featured work showcase in creator profile.
class FeaturedWorkItem {
  final String title;
  final String subtitle;
  final String views;
  final String? imageUrl;

  const FeaturedWorkItem({
    required this.title,
    required this.subtitle,
    required this.views,
    this.imageUrl,
  });
}

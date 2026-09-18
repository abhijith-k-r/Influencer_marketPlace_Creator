import 'creator_profile_data.dart';

/// Pre-populated mock data for creator profile view matching HTML mockup.
abstract final class MockCreatorProfileData {
  static const CreatorProfileData profile = CreatorProfileData(
    name: 'Aarav Sharma',
    handle: '@aarav_streetcuts',
    tagline: 'Urban Streetwear & Tech Lifestyle',
    reach: '148K',
    rating: '4.8',
    collabs: '18',
    bio:
        'Visual storyteller & 4K cinematic reel director specializing in urban sneaker drops, everyday carry tech & lifestyle narratives. Collaborated with 20+ top D2C labels across India.',
    networkTotal: '245.8K Total',
    instagramFollowers: '142K',
    youtubeFollowers: '88K',
    threadsFollowers: '15.8K',
    email: 'aarav.creates@gmail.com',
    phone: '+91 98765 43210',
    niche: 'Fashion, Streetwear, Consumer Tech',
  );

  static const List<FeaturedWorkItem> featuredWorks = [
    FeaturedWorkItem(
      title: 'UrbanKicks Gen-2',
      subtitle: '4K Showcase Reel',
      views: '84K',
    ),
    FeaturedWorkItem(
      title: 'Aura Audio ANC',
      subtitle: 'Tech Unboxing Reel',
      views: '52K',
    ),
    FeaturedWorkItem(
      title: 'Summer Hydration',
      subtitle: 'Fitness Brand Spot',
      views: '41K',
    ),
    FeaturedWorkItem(
      title: 'Festive Velvet Drop',
      subtitle: 'D2C Festive Campaign',
      views: '96K',
    ),
  ];
}

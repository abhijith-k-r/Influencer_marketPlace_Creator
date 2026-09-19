import '../models/creator_profile_data.dart';
import '../models/mock_creator_profile_data.dart';

/// Repository responsible for loading and updating creator profile data.
class CreatorProfileRepository {
  Future<CreatorProfileData> getProfile() async {
    // Simulated async fetch
    await Future.delayed(const Duration(milliseconds: 100));
    return MockCreatorProfileData.profile;
  }

  Future<List<FeaturedWorkItem>> getFeaturedWorks() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return MockCreatorProfileData.featuredWorks;
  }
}

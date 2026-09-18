import '../../../../../core/constants/app_assets.dart';
import '../models/creator_model.dart';

abstract class CreatorRepository {
  Future<List<CreatorModel>> getTopCreators({String? filter, String? query});
}

class MockCreatorRepository implements CreatorRepository {
  static const List<CreatorModel> _allCreators = [
    CreatorModel(
      id: 'c1',
      name: 'Aarav Sharma',
      niche: 'Sneakerhead & Streetwear',
      avatarUrl: AppAssets.aaravSharma,
      platform: PlatformType.instagram,
      followersCount: '48.5K',
      engagementRate: '4.9%',
      matchPercentage: 98,
      priceStarting: '₹15k/reel',
      isOnline: true,
      isVerified: true,
    ),
    CreatorModel(
      id: 'c2',
      name: 'Riya Sen',
      niche: 'Luxury Fashion & Lifestyle',
      avatarUrl: AppAssets.riyaSen,
      platform: PlatformType.youtube,
      followersCount: '125K',
      engagementRate: '6.2%',
      matchPercentage: 96,
      priceStarting: '₹30k/collab',
      isOnline: true,
      isVerified: true,
    ),
    CreatorModel(
      id: 'c3',
      name: 'Kabir Mehta',
      niche: 'Fitness & Movement',
      avatarUrl: AppAssets.kabirMehta,
      platform: PlatformType.instagram,
      followersCount: '32.4K',
      engagementRate: '5.1%',
      matchPercentage: 94,
      priceStarting: '₹12k/reel',
      isOnline: true,
      isVerified: true,
    ),
    CreatorModel(
      id: 'c4',
      name: 'Ananya Verma',
      niche: 'Tech & Gadget Reviews',
      avatarUrl: AppAssets.ananyaVerma,
      platform: PlatformType.youtube,
      followersCount: '89.2K',
      engagementRate: '7.4%',
      matchPercentage: 91,
      priceStarting: '₹22k/video',
      isOnline: true,
      isVerified: true,
    ),
  ];

  @override
  Future<List<CreatorModel>> getTopCreators({
    String? filter,
    String? query,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    var results = List<CreatorModel>.from(_allCreators);

    if (query != null && query.isNotEmpty) {
      final q = query.toLowerCase();
      results = results.where((c) {
        return c.name.toLowerCase().contains(q) ||
            c.niche.toLowerCase().contains(q);
      }).toList();
    }

    if (filter != null && filter != 'All Creators') {
      if (filter == 'Instagram') {
        results =
            results.where((c) => c.platform == PlatformType.instagram).toList();
      } else if (filter == 'YouTube') {
        results =
            results.where((c) => c.platform == PlatformType.youtube).toList();
      } else if (filter == 'Verified') {
        results = results.where((c) => c.isVerified).toList();
      }
    }

    return results;
  }
}

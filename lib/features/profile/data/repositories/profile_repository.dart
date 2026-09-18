import '../models/brand_profile_model.dart';

abstract class ProfileRepository {
  Future<BrandProfileModel> getBrandProfile();
  Future<BrandProfileModel> toggleAutoDisbursement(bool value);
}

class MockProfileRepository implements ProfileRepository {
  BrandProfileModel _profile = const BrandProfileModel(
    name: 'UrbanKicks Studio',
    companyName: 'UrbanKicks Studio Pvt Ltd',
    categorySubtitle: 'D2C Footwear & Streetwear • Member since 2022',
    email: 'partnerships@urbankicks.in',
    phone: '+91 98765 43210',
    nicheTags: ['Fashion', 'Sneakers', 'Streetwear'],
    productDetails:
        'Handcrafted sustainable vegan leather sneakers & limited apparel drops.',
    bio:
        'India\'s fastest growing urban streetwear brand, partnering with macro & micro creators.',
    socialChannels: [
      '@urbankicks.official (240K)',
      'UrbanKicks TV (45K)',
    ],
    website: 'www.urbankicks.in',
    campaignCount: 34,
    creatorScore: 4.9,
    escrowSafePercent: 100,
    autoDisbursementEnabled: true,
  );

  @override
  Future<BrandProfileModel> getBrandProfile() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _profile;
  }

  @override
  Future<BrandProfileModel> toggleAutoDisbursement(bool value) async {
    _profile = _profile.copyWith(autoDisbursementEnabled: value);
    return _profile;
  }
}

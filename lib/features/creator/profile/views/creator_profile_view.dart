import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/mock_creator_profile_data.dart';
import '../widgets/profile_account_settings_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_bio_card.dart';
import '../widgets/profile_featured_works_card.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_logout_section.dart';

/// Full screen view for Creator Profile tab in bottom navigation.
class CreatorProfileView extends StatelessWidget {
  const CreatorProfileView({super.key});

  void _onLogout(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.roleSelection, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    const profile = MockCreatorProfileData.profile;
    const works = MockCreatorProfileData.featuredWorks;

    return Scaffold(
      backgroundColor: CreatorColors.background,
      appBar: const ProfileAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          ProfileHeaderCard(profile: profile, onEditProfile: () {}),
          const SizedBox(height: 16),
          const ProfileBioCard(profile: profile),
          const SizedBox(height: 16),
          const ProfileFeaturedWorksCard(works: works),
          const SizedBox(height: 16),
          const ProfileAccountSettingsCard(),
          const SizedBox(height: 20),
          ProfileLogoutSection(onLogout: () => _onLogout(context)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

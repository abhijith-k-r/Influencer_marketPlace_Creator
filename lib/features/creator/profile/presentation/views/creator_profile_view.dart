import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_state.dart';
import '../../data/models/mock_creator_profile_data.dart';
import '../widgets/profile_account_settings_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_bio_card.dart';
import '../widgets/profile_featured_works_card.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_logout_section.dart';

/// Pure StatelessWidget for Creator Profile tab in bottom navigation using AppScaffold (<65 LOC).
class CreatorProfileView extends StatelessWidget {
  const CreatorProfileView({super.key});

  void _onLogout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.roleSelection, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.watch<CreatorProfileBloc?>();
    final isLoading = profileBloc?.state is ProfileLoading;
    final profile = profileBloc?.state is ProfileLoaded
        ? (profileBloc!.state as ProfileLoaded).profile
        : MockCreatorProfileData.profile;
    final works = profileBloc?.state is ProfileLoaded
        ? (profileBloc!.state as ProfileLoaded).featuredWorks
        : MockCreatorProfileData.featuredWorks;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      appBar: const ProfileAppBar(),
      body: isLoading
          ? const AppLoadingCenter()
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                ProfileHeaderCard(profile: profile, onEditProfile: () {}),
                const SizedBox(height: 16),
                ProfileBioCard(profile: profile),
                const SizedBox(height: 16),
                ProfileFeaturedWorksCard(works: works),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../role_selection/bloc/role_bloc.dart';
import '../../../../role_selection/bloc/role_event.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_state.dart';
import '../widgets/brand_escrow_preference_card.dart';
import '../widgets/brand_header_card.dart';
import '../widgets/brand_logout_button.dart';
import '../widgets/brand_org_details_sheet.dart';
import '../widgets/brand_profile_top_bar.dart';
import '../widgets/lookbook_section.dart';
import '../widgets/stats_strip.dart';

/// Pure StatelessWidget for Brand Profile screen using AppScaffold & AppLoadingCenter (<85 LOC).
class BrandProfileScreen extends StatelessWidget {
  const BrandProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.background,
      useSafeArea: true,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.logoutStatus == LogoutStatus.loggedOut) {
            context.read<RoleBloc>().add(const ResetRoleEvent());
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.roleSelection,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          final profile = state.profile;
          if (profile == null) return const AppLoadingCenter();

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                const BrandProfileTopBar(),
                const SizedBox(height: 14),
                BrandHeaderCard(
                  brandName: profile.name,
                  subtitle: profile.categorySubtitle,
                  onEditProfile: () {},
                ),
                const SizedBox(height: 14),
                StatsStrip(
                  campaignsCount: profile.campaignCount,
                  creatorScore: profile.creatorScore,
                  escrowSafePercent: profile.escrowSafePercent,
                ),
                const SizedBox(height: 14),
                BrandOrgDetailsSheet(profile: profile),
                const SizedBox(height: 14),
                const LookbookSection(),
                const SizedBox(height: 14),
                BrandEscrowPreferenceCard(profile: profile),
                const SizedBox(height: 20),
                const BrandLogoutButton(),
                const SizedBox(height: 14),
                _buildLegalFooter(),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegalFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Terms of Service', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text('•', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
        ),
        Text('Privacy Policy', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text('•', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
        ),
        Text('Version 2.4.0', style: AppTextStyles.labelSm(color: AppColors.tertiaryContainer)),
      ],
    );
  }
}

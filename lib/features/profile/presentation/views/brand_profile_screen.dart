import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../role_selection/bloc/role_bloc.dart';
import '../../../role_selection/bloc/role_event.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../../bloc/profile_state.dart';
import '../widgets/brand_header_card.dart';
import '../widgets/lookbook_section.dart';
import '../widgets/profile_info_tile.dart';
import '../widgets/stats_strip.dart';

class BrandProfileScreen extends StatefulWidget {
  const BrandProfileScreen({super.key});

  @override
  State<BrandProfileScreen> createState() => _BrandProfileScreenState();
}

class _BrandProfileScreenState extends State<BrandProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
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
            if (profile == null) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  // Top Sub-header
                  _buildTopBar(context),

                  const SizedBox(height: 14),

                  // Brand Header Card
                  BrandHeaderCard(
                    brandName: profile.name,
                    subtitle: profile.categorySubtitle,
                    onEditProfile: () {},
                  ),

                  const SizedBox(height: 14),

                  // Performance Quick Stats Strip
                  StatsStrip(
                    campaignsCount: profile.campaignCount,
                    creatorScore: profile.creatorScore,
                    escrowSafePercent: profile.escrowSafePercent,
                  ),

                  const SizedBox(height: 14),

                  // Organization Details Sheet
                  _buildOrgDetailsSheet(context, profile),

                  const SizedBox(height: 14),

                  // Lookbook Assets Section
                  const LookbookSection(),

                  const SizedBox(height: 14),

                  // Escrow Auto-Disbursement Preference Card
                  _buildEscrowPreferenceCard(context, profile),

                  const SizedBox(height: 20),

                  // Full Width Log Out Button with Micro-interaction
                  _buildLogoutButton(context, state.logoutStatus),

                  const SizedBox(height: 14),

                  // Footer Legal Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms of Service',
                        style: AppTextStyles.labelSm(color: AppColors.tertiary),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          '•',
                          style: AppTextStyles.labelSm(color: AppColors.tertiary),
                        ),
                      ),
                      Text(
                        'Privacy Policy',
                        style: AppTextStyles.labelSm(color: AppColors.tertiary),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          '•',
                          style: AppTextStyles.labelSm(color: AppColors.tertiary),
                        ),
                      ),
                      Text(
                        'Version 2.4.0',
                        style: AppTextStyles.labelSm(
                          color: AppColors.tertiaryContainer,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        InkWell(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          borderRadius: AppRadii.roundedPill,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: AppColors.onSurface,
            ),
          ),
        ),

        // Enterprise Verified Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: AppRadii.roundedPill,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'ENTERPRISE VERIFIED',
                style: AppTextStyles.labelSm(
                  color: AppColors.primary,
                ).copyWith(
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),

        // Settings Button
        InkWell(
          onTap: () {},
          borderRadius: AppRadii.roundedPill,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.settings_outlined,
              size: 20,
              color: AppColors.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrgDetailsSheet(BuildContext context, dynamic profile) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Organization Profile',
                style: AppTextStyles.labelLg(
                  color: AppColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Verified Entity',
                style: AppTextStyles.labelSm(color: AppColors.tertiary),
              ),
            ],
          ),

          const SizedBox(height: 8),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Brand Legal Name
          ProfileInfoTile(
            icon: Icons.storefront_rounded,
            label: 'Brand Name',
            value: profile.companyName,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Business Email
          ProfileInfoTile(
            icon: Icons.mail_outline_rounded,
            label: 'Business Email',
            value: profile.email,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Contact Phone
          ProfileInfoTile(
            icon: Icons.call_outlined,
            label: 'Contact Phone',
            value: profile.phone,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Category & Niche Tags
          ProfileInfoTile(
            icon: Icons.sell_outlined,
            label: 'Category & Niche',
            customContent: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: (profile.nicheTags as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: AppTextStyles.labelSm(
                        color: AppColors.onSurface,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Product Details
          ProfileInfoTile(
            icon: Icons.inventory_2_outlined,
            label: 'Product Details',
            value: profile.productDetails,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Brand Bio
          ProfileInfoTile(
            icon: Icons.info_outline_rounded,
            label: 'Brand Bio',
            value: profile.bio,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Social Channels
          ProfileInfoTile(
            icon: Icons.share_outlined,
            label: 'Social Channels',
            customContent: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.photo_camera_rounded,
                        size: 15,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '@urbankicks.official (240K)',
                        style: AppTextStyles.bodySm(
                          color: AppColors.onSurface,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.smart_display_rounded,
                        size: 15,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'UrbanKicks TV (45K)',
                        style: AppTextStyles.bodySm(
                          color: AppColors.onSurface,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),

          // Brand Website
          ProfileInfoTile(
            icon: Icons.language_rounded,
            label: 'Brand Website',
            value: profile.website,
            trailingIcon: Icons.open_in_new_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildEscrowPreferenceCard(BuildContext context, dynamic profile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  size: 20,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Escrow Auto-Disbursement',
                    style: AppTextStyles.labelLg(
                      color: AppColors.onSurface,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Funds released upon campaign draft sign-off',
                    style: AppTextStyles.bodySm(color: AppColors.tertiary),
                  ),
                ],
              ),
            ],
          ),

          // Interactive Toggle Switch
          Switch(
            value: profile.autoDisbursementEnabled,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.tertiaryContainer.withValues(alpha: 0.5),
            onChanged: (val) {
              context
                  .read<ProfileBloc>()
                  .add(ToggleAutoDisbursementEvent(val));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, LogoutStatus status) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: status == LogoutStatus.loggingOut
              ? null
              : () {
                  context
                      .read<ProfileBloc>()
                      .add(const LogOutRequestedEvent());
                },
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (status == LogoutStatus.loggingOut) ...[
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Securing Session...',
                    style: AppTextStyles.labelLg(color: Colors.white)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ] else if (status == LogoutStatus.loggedOut) ...[
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Signed Out',
                    style: AppTextStyles.labelLg(color: Colors.white)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ] else ...[
                  const Icon(
                    Icons.logout_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Log Out',
                    style: AppTextStyles.labelLg(color: Colors.white)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

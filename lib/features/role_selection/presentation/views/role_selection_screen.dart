import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../bloc/role_bloc.dart';
import '../../bloc/role_event.dart';
import '../../bloc/role_state.dart';
import '../../data/models/user_role.dart';

/// Role Selection ("Choosing Screen") matching HTML layout:
/// Step indicator, Interactive Brand & Creator cards, role-adaptive palette, and dynamic CTA.
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoleBloc, RoleState>(
      listener: (context, state) {
        if (state.isConfirmed) {
          if (state.selectedRole == UserRole.creator) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.creatorShell);
          } else {
            Navigator.of(context).pushReplacementNamed(AppRoutes.brandShell);
          }
        }
      },
      builder: (context, state) {
        final selectedRole = state.selectedRole;
        final hasSelection = state.hasSelection;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Top Navigation & Progress Bar
                  Row(
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
                          decoration: const BoxDecoration(
                            color: AppColors.surfaceContainerLow,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ),

                      // 3 Dots Progress Pill
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 12,
                      //     vertical: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.surfaceContainerHigh,
                      //     borderRadius: AppRadii.roundedPill,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 8,
                      //         height: 8,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: selectedRole == UserRole.creator
                      //               ? AppColors.secondary
                      //               : AppColors.primary,
                      //         ),
                      //       ),
                      //       const SizedBox(width: 6),
                      //       Container(
                      //         width: 8,
                      //         height: 8,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: AppColors.outlineVariant.withValues(alpha: 0.6),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 6),
                      //       Container(
                      //         width: 8,
                      //         height: 8,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: AppColors.outlineVariant.withValues(alpha: 0.6),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // Help button
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Help',
                          style: AppTextStyles.labelMd(
                            color: AppColors.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Step Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: selectedRole == UserRole.creator
                          ? AppColors.secondaryFixed
                          : AppColors.primaryFixed,
                      borderRadius: AppRadii.roundedPill,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 13,
                          color: selectedRole == UserRole.creator
                              ? AppColors.onSecondaryFixedVariant
                              : AppColors.onPrimaryFixed,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'STEP 1 OF 3',
                          style: AppTextStyles.labelSm(
                            color: selectedRole == UserRole.creator
                                ? AppColors.onSecondaryFixedVariant
                                : AppColors.onPrimaryFixed,
                          ).copyWith(letterSpacing: 0.8),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Screen Title & Subtitle
                  Text(
                    'Choose Your Role',
                    style: AppTextStyles.headlineLg(color: AppColors.onSurface),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tailor your experience to connect, collaborate, and scale authentic partnerships.',
                    style: AppTextStyles.bodyMd(color: AppColors.tertiary),
                  ),

                  const Spacer(),

                  // Role Card 1: Brand
                  _buildRoleCard(
                    context: context,
                    role: UserRole.brand,
                    isSelected: selectedRole == UserRole.brand,
                    icon: Icons.corporate_fare_rounded,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.surfaceContainerHigh,
                    title: "I'm a Brand",
                    subtitle: 'Agencies & Marketers',
                    description:
                        'Hire verified creators, launch targeted milestone campaigns, and safeguard payments with enterprise escrow.',
                    tagIcon: Icons.verified_user_rounded,
                    tagText: 'Escrow Protected',
                    tagColor: AppColors.primary,
                    metaText: '14.2k+ Creators Ready',
                    onTap: () {
                      context.read<RoleBloc>().add(
                        const SelectRoleEvent(UserRole.brand),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Role Card 2: Creator
                  _buildRoleCard(
                    context: context,
                    role: UserRole.creator,
                    isSelected: selectedRole == UserRole.creator,
                    icon: Icons.video_camera_front_rounded,
                    iconColor: AppColors.secondary,
                    iconBgColor: AppColors.secondaryFixed,
                    title: "I'm a Creator",
                    subtitle: 'Influencers & Artists',
                    description:
                        'Get discovered by premier brands, monetize your authentic voice, and unlock recurring paid brand sponsorships.',
                    tagIcon: Icons.monetization_on_rounded,
                    tagText: 'Instant Payouts',
                    tagColor: AppColors.secondary,
                    metaText: '\$3.8M+ Disbursed',
                    onTap: () {
                      context.read<RoleBloc>().add(
                        const SelectRoleEvent(UserRole.creator),
                      );
                    },
                  ),

                  const Spacer(),

                  // Bottom CTA Container
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: hasSelection
                          ? (selectedRole == UserRole.creator
                                ? AppColors.secondary
                                : AppColors.primary)
                          : AppColors.surfaceContainerHighest.withValues(
                              alpha: 0.6,
                            ),
                      borderRadius: AppRadii.roundedLg,
                      boxShadow: hasSelection
                          ? (selectedRole == UserRole.creator
                                ? AppShadows.secondaryGlow
                                : AppShadows.primaryGlow)
                          : null,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: hasSelection
                            ? () {
                                context.read<RoleBloc>().add(
                                  const ConfirmRoleEvent(),
                                );
                              }
                            : null,
                        borderRadius: AppRadii.roundedLg,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: AppTextStyles.labelLg(
                                  color: hasSelection
                                      ? Colors.white
                                      : AppColors.tertiary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 20,
                                color: hasSelection
                                    ? Colors.white
                                    : AppColors.tertiary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Center(
                    child: Text(
                      'You can switch or link accounts anytime in Settings',
                      style: AppTextStyles.labelSm(color: AppColors.tertiary),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required UserRole role,
    required bool isSelected,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String description,
    required IconData tagIcon,
    required String tagText,
    required Color tagColor,
    required String metaText,
    required VoidCallback onTap,
  }) {
    final activeBorderColor = role == UserRole.creator
        ? AppColors.secondary
        : AppColors.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? activeBorderColor : Colors.transparent,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: activeBorderColor.withValues(alpha: 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : AppShadows.cardSm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: iconBgColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(icon, size: 26, color: iconColor),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.headlineSm(
                                color: AppColors.onSurface,
                              ),
                            ),
                            Text(
                              subtitle,
                              style: AppTextStyles.labelSm(
                                color: AppColors.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Radio indicator
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? activeBorderColor
                            : AppColors.surfaceContainerHigh,
                      ),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: isSelected ? 8 : 0,
                          height: isSelected ? 8 : 0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  description,
                  style: AppTextStyles.bodyMd(color: AppColors.tertiary),
                ),

                const SizedBox(height: 14),

                // Category badge & Social proof strip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(tagIcon, size: 16, color: tagColor),
                          const SizedBox(width: 6),
                          Text(
                            tagText,
                            style: AppTextStyles.labelSm(
                              color: tagColor,
                            ).copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        metaText,
                        style: AppTextStyles.labelSm(color: AppColors.tertiary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

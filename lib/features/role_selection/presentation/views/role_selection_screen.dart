import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/shared/app_scaffold.dart';
import '../../bloc/role_bloc.dart';
import '../../bloc/role_event.dart';
import '../../bloc/role_state.dart';
import '../../data/models/user_role.dart';
import '../widgets/role_selection_card.dart';
import '../widgets/role_selection_cta.dart';
import '../widgets/role_selection_top_bar.dart';

/// Pure StatelessWidget for Role Selection screen, cleanly assembled from sub-widgets.
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

        return AppScaffold(
          backgroundColor: AppColors.background,
          useSafeArea: true,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              RoleSelectionTopBar(selectedRole: selectedRole),
              const Spacer(),
              RoleSelectionCard(
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
                onTap: () => context.read<RoleBloc>().add(
                  const SelectRoleEvent(UserRole.brand),
                ),
              ),
              const SizedBox(height: 16),
              RoleSelectionCard(
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
                onTap: () => context.read<RoleBloc>().add(
                  const SelectRoleEvent(UserRole.creator),
                ),
              ),
              const Spacer(),
              RoleSelectionCta(
                hasSelection: state.hasSelection,
                onConfirm: () =>
                    context.read<RoleBloc>().add(const ConfirmRoleEvent()),
                    selectedRole: selectedRole,
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}

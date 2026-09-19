import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/navigation/nav_cubit.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/brand/brand_bottom_nav_bar.dart';
import 'package:creator_side/core/widgets/brand/brand_side_drawer.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import 'package:creator_side/features/brand/campaigns/presentation/views/brand_campaign_list_screen.dart';
import 'package:creator_side/features/brand/chat/presentation/views/chat_list_screen.dart';
import 'package:creator_side/features/brand/home/presentation/views/brand_home_screen.dart';
import 'package:creator_side/features/brand/payments/presentation/views/brand_payment_dashboard_screen.dart';
import 'package:creator_side/features/brand/profile/presentation/views/brand_profile_screen.dart';

/// Pure StatelessWidget navigation shell for Brand experiences driven by BrandNavCubit (<50 LOC).
class BrandMainShell extends StatelessWidget {
  final int initialTab;

  const BrandMainShell({super.key, this.initialTab = 0});

  @override
  Widget build(BuildContext context) {
    final tabFromCubit = context.watch<BrandNavCubit?>()?.state ?? initialTab;
    final currentIndex = tabFromCubit == 0 && initialTab != 0 ? initialTab : tabFromCubit;

    return AppScaffold(
      backgroundColor: AppColors.background,
      drawer: const BrandSideDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          BrandHomeScreen(),
          BrandCampaignListScreen(),
          BrandPaymentDashboardScreen(),
          ChatListScreen(),
          BrandProfileScreen(),
        ],
      ),
      bottomNavigationBar: BrandBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => context.read<BrandNavCubit?>()?.setTab(index),
      ),
    );
  }
}

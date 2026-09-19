import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/navigation/nav_cubit.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import 'package:creator_side/core/widgets/creator/creator_bottom_nav_bar.dart';
import 'package:creator_side/core/widgets/creator/creator_side_drawer.dart';
import 'package:creator_side/features/creator/home/presentation/views/creator_home_view.dart';
import 'package:creator_side/features/creator/messages/presentation/views/creator_messages_view.dart';
import 'package:creator_side/features/creator/my_works/presentation/views/my_works_view.dart';
import 'package:creator_side/features/creator/payments/presentation/views/creator_payments_view.dart';
import 'package:creator_side/features/creator/profile/presentation/views/creator_profile_view.dart';

/// Pure StatelessWidget navigation shell for creator experiences driven by CreatorNavCubit.
class CreatorShellView extends StatelessWidget {
  final int initialTab;

  const CreatorShellView({super.key, this.initialTab = 0});

  @override
  Widget build(BuildContext context) {
    final tabFromCubit = context.watch<CreatorNavCubit?>()?.state ?? initialTab;
    final currentIndex = tabFromCubit == 0 && initialTab != 0 ? initialTab : tabFromCubit;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      drawer: const CreatorSideDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CreatorHomeView(),
          CreatorMessagesView(),
          CreatorPaymentsView(),
          MyWorksView(),
          CreatorProfileView(),
        ],
      ),
      bottomNavigationBar: CreatorBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => context.read<CreatorNavCubit?>()?.setTab(index),
      ),
    );
  }
}

/// Backwards compatibility alias
typedef CreatorNavigationView = CreatorShellView;

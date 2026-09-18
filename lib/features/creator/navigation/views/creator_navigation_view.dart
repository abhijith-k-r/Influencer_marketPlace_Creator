import 'package:flutter/material.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../home/views/creator_home_view.dart';
import '../../messages/views/creator_messages_view.dart';
import '../../my_works/views/my_works_view.dart';
import '../../payments/views/creator_payments_view.dart';
import '../../profile/views/creator_profile_view.dart';
import '../widgets/creator_bottom_nav_bar.dart';
import '../widgets/creator_side_drawer.dart';

class CreatorNavigationView extends StatefulWidget {
  final int initialTab;

  const CreatorNavigationView({super.key, this.initialTab = 0});

  @override
  State<CreatorNavigationView> createState() => _CreatorNavigationViewState();
}

class _CreatorNavigationViewState extends State<CreatorNavigationView> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      drawer: const CreatorSideDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          CreatorHomeView(),
          CreatorMessagesView(),
          CreatorPaymentsView(),
          MyWorksView(),
          CreatorProfileView(),
        ],
      ),
      bottomNavigationBar: CreatorBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

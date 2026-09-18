import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/brand_bottom_nav_bar.dart';
import '../../../../core/widgets/brand_side_drawer.dart';
import '../../../campaigns/presentation/views/brand_campaign_list_screen.dart';
import '../../../chat/presentation/views/chat_list_screen.dart';
import '../../../home/presentation/views/brand_home_screen.dart';
import '../../../payments/presentation/views/brand_payment_dashboard_screen.dart';
import '../../../profile/presentation/views/brand_profile_screen.dart';

class BrandMainShell extends StatefulWidget {
  final int initialTab;

  const BrandMainShell({super.key, this.initialTab = 0});

  @override
  State<BrandMainShell> createState() => _BrandMainShellState();
}

class _BrandMainShellState extends State<BrandMainShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const BrandSideDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          BrandHomeScreen(),
          BrandCampaignListScreen(),
          BrandPaymentDashboardScreen(),
          ChatListScreen(),
          BrandProfileScreen(),
        ],
      ),
      bottomNavigationBar: BrandBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


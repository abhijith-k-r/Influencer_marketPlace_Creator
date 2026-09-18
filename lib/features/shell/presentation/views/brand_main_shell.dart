import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/brand_bottom_nav_bar.dart';
import '../../../../core/widgets/brand_side_drawer.dart';
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
        children: [
          const BrandHomeScreen(),
          _buildPlaceholderView(
            title: 'Campaigns',
            icon: Icons.campaign_rounded,
            description: 'Manage brand briefs, deliverables, and milestones',
          ),
          const BrandPaymentDashboardScreen(),
          const ChatListScreen(),
          const BrandProfileScreen(),
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

  Widget _buildPlaceholderView({
    required String title,
    required IconData icon,
    required String description,
  }) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: AppTextStyles.headlineMd(color: AppColors.onSurface),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMd(color: AppColors.tertiary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

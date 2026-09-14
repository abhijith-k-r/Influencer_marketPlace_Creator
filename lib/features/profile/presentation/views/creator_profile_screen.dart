import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/connected_channels_carousel.dart';
import '../widgets/profile_analytics_matrix.dart';
import '../widgets/profile_bottom_cta_bar.dart';
import '../widgets/profile_brand_trust_tab.dart';
import '../widgets/profile_deliverables_tab.dart';
import '../widgets/profile_featured_work_tab.dart';
import '../widgets/profile_hero_card.dart';

class CreatorProfileScreen extends StatefulWidget {
  final VoidCallback? onBack;

  const CreatorProfileScreen({super.key, this.onBack});

  @override
  State<CreatorProfileScreen> createState() => _CreatorProfileScreenState();
}

class _CreatorProfileScreenState extends State<CreatorProfileScreen> {
  int _selectedTabIndex = 0;
  static const _tabTitles = ['Featured Work', 'Deliverables', 'Brand Trust'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: AppColors.textPrimary,
          onPressed: widget.onBack ?? () => Navigator.of(context).maybePop(),
        ),
        title: Text('Creator Profile', style: AppTextStyles.h4),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, size: 20),
            color: AppColors.textPrimary,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded, size: 22),
            color: AppColors.textPrimary,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const ProfileHeroCard(),
                  const SizedBox(height: 16),
                  const ConnectedChannelsCarousel(),
                  const SizedBox(height: 16),
                  const ProfileAnalyticsMatrix(),
                  const SizedBox(height: 20),
                  _buildTabBar(),
                  const SizedBox(height: 16),
                  _buildActiveTab(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const ProfileBottomCtaBar(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: List.generate(_tabTitles.length, (index) {
        final isSelected = _selectedTabIndex == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTabIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderLight),
              ),
              child: Center(
                child: Text(
                  _tabTitles[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildActiveTab() {
    switch (_selectedTabIndex) {
      case 0:
        return const ProfileFeaturedWorkTab();
      case 1:
        return const ProfileDeliverablesTab();
      case 2:
      default:
        return const ProfileBrandTrustTab();
    }
  }
}

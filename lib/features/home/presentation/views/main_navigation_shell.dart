import 'package:flutter/material.dart';
import '../../../../core/widgets/app_nav_bar.dart';
import '../../../campaigns/presentation/views/campaign_discovery_screen.dart';
import '../../../dashboard/presentation/views/dashboard_screen.dart';

/// App shell housing the 5-tab persistent bottom navigation bar.
class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    CampaignDiscoveryScreen(),
    _PlaceholderTab(title: 'Messages', icon: Icons.chat_bubble_rounded),
    _PlaceholderTab(
      title: 'Payments',
      icon: Icons.account_balance_wallet_rounded,
    ),
    _PlaceholderTab(title: 'Profile', icon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: AppNavBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;
  final IconData icon;

  const _PlaceholderTab({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: const Color(0xFF45464D)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0B1C30),
            ),
          ),
        ],
      ),
    );
  }
}

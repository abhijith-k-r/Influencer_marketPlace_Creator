import 'package:flutter/material.dart';
import '../../../../core/widgets/app_nav_bar.dart';
import '../../../campaigns/presentation/views/campaign_discovery_screen.dart';
import '../../../dashboard/presentation/views/dashboard_screen.dart';
import '../../../messages/presentation/views/messages_inbox_screen.dart';
import '../../../payments/presentation/views/payments_screen.dart';
import '../../../profile/presentation/views/creator_profile_screen.dart';

/// App shell housing the 5-tab persistent bottom navigation bar.
class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    const DashboardScreen(),
    const CampaignDiscoveryScreen(),
    const MessagesInboxScreen(),
    PaymentsScreen(onBack: () => setState(() => _currentIndex = 0)),
    CreatorProfileScreen(onBack: () => setState(() => _currentIndex = 0)),
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

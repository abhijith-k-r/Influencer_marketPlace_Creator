import 'package:flutter/material.dart';
import '../widgets/campaign_spotlight_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/greeting_card.dart';
import '../widgets/marketplace_pulse_section.dart';
import '../widgets/performance_curves_card.dart';
import '../widgets/priority_action_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/recent_activity_section.dart';

/// Creator Dashboard screen displaying marketplace pulse, charts, and actions.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F9FF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GreetingCard(),
                    SizedBox(height: 16),
                    PriorityActionCard(),
                    SizedBox(height: 16),
                    MarketplacePulseSection(),
                    SizedBox(height: 16),
                    PerformanceCurvesCard(),
                    SizedBox(height: 16),
                    CampaignSpotlightCard(),
                    SizedBox(height: 16),
                    RecentActivitySection(),
                    SizedBox(height: 16),
                    QuickActionsGrid(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

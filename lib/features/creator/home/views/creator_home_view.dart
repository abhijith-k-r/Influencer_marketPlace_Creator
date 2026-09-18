import 'package:flutter/material.dart';
import '../../../../core/theme/creator_colors.dart';
import '../models/mock_creator_opportunities.dart';
import '../widgets/creator_filter_tray.dart';
import '../widgets/creator_hero_match_banner.dart';
import '../widgets/creator_home_app_bar.dart';
import '../widgets/creator_opportunity_card.dart';
import '../widgets/creator_pulse_toast_row.dart';

class CreatorHomeView extends StatefulWidget {
  const CreatorHomeView({super.key});

  @override
  State<CreatorHomeView> createState() => _CreatorHomeViewState();
}

class _CreatorHomeViewState extends State<CreatorHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const CreatorHomeAppBar(),
            Expanded(
              child: RefreshIndicator(
                color: CreatorColors.primary,
                onRefresh: () async => await Future.delayed(const Duration(milliseconds: 600)),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CreatorPulseToastRow(),
                      const SizedBox(height: 8),
                      const CreatorFilterTray(),
                      const SizedBox(height: 12),
                      const CreatorHeroMatchBanner(),
                      const SizedBox(height: 14),
                      ...mockCreatorOpportunities.map((opp) => CreatorOpportunityCard(opportunity: opp)),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

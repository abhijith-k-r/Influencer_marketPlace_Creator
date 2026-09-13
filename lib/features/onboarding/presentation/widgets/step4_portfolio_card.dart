import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'portfolio_action_buttons.dart';
import 'portfolio_brand_chips_field.dart';
import 'portfolio_campaign_url_field.dart';
import 'portfolio_performance_bento.dart';
import 'portfolio_rates_metrics_field.dart';
import 'portfolio_tip_box.dart';

/// Main White Card with Ambient Top Glow Strip for Step 4 matching Figma.
class Step4PortfolioCard extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const Step4PortfolioCard({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
      ),
      child: ClipRRect(
        borderRadius: AppRadii.roundedCard,
        child: Column(
          children: [
            Container(
              height: 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE1E0FF),
                    Color(0xFFE5EEFF),
                    Color(0xFFC0C1FF),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const PortfolioBrandChipsField(),
                  const SizedBox(height: 18),
                  const PortfolioCampaignUrlField(),
                  const SizedBox(height: 18),
                  const PortfolioRatesMetricsField(),
                  const SizedBox(height: 18),
                  const PortfolioPerformanceBento(),
                  const SizedBox(height: 18),
                  const PortfolioTipBox(),
                  const SizedBox(height: 18),
                  PortfolioActionButtons(
                    onContinue: onContinue,
                    onBack: onBack,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

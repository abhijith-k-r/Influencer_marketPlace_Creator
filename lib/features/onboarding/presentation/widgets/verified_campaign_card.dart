import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'verified_campaign_details.dart';
import 'verified_campaign_quote_box.dart';
import 'verified_campaign_thumbnail.dart';

/// Single verified campaign card matching Figma specs.
class VerifiedCampaignCard extends StatelessWidget {
  final String platform;
  final String metricText;
  final IconData metricIcon;
  final String brandTitle;
  final String campaignSubtitle;
  final String quote;
  final String linkUrl;
  final IconData productIcon;
  final IconData badgeIcon;
  final Color badgeColor;

  const VerifiedCampaignCard({
    super.key,
    required this.platform,
    required this.metricText,
    required this.metricIcon,
    required this.brandTitle,
    required this.campaignSubtitle,
    required this.quote,
    required this.linkUrl,
    required this.productIcon,
    required this.badgeIcon,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerifiedCampaignThumbnail(
                productIcon: productIcon,
                badgeIcon: badgeIcon,
                badgeColor: badgeColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: VerifiedCampaignDetails(
                  platform: platform,
                  metricText: metricText,
                  metricIcon: metricIcon,
                  brandTitle: brandTitle,
                  campaignSubtitle: campaignSubtitle,
                ),
              ),
            ],
          ),
          VerifiedCampaignQuoteBox(quote: quote, linkUrl: linkUrl),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Featured Campaign Links card displaying past content links matching Figma.
class FeaturedCampaignLinksCard extends StatelessWidget {
  const FeaturedCampaignLinksCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            child: Text('Featured Campaign Links', overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
            )),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: const BoxDecoration(color: AppColors.trustBadgeBackground, borderRadius: AppRadii.roundedPill),
            child: Text('Min. 1 Required', style: GoogleFonts.plusJakartaSans(
              fontSize: 10.5, fontWeight: FontWeight.w700, color: AppColors.primary,
            )),
          ),
        ]),
        const SizedBox(height: 2),
        Text('Paste URLs of your highest-converting videos/posts.', style: GoogleFonts.plusJakartaSans(
          fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
        )),
        const SizedBox(height: 14),
        _tile('Ultimate Desk Setup 2026 (Logitech)', 'https://youtube.com/watch?v=setup2026',
            '450K Views • 8.2% CTR', Icons.play_circle_fill_rounded, const Color(0xFFFF0000)),
        const SizedBox(height: 10),
        _tile('Productivity Workflow Reel (Notion)', 'https://instagram.com/reel/notionflow',
            '120K Views • 14.5K Saves', Icons.camera_alt_rounded, const Color(0xFFE1306C)),
      ]),
    );
  }

  Widget _tile(String title, String url, String metrics, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: AppColors.inputBackground, borderRadius: AppRadii.roundedCard),
      child: Row(children: [
        Container(
          width: 34, height: 34,
          decoration: const BoxDecoration(color: AppColors.surfaceWhite, borderRadius: AppRadii.roundedSm),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
          )),
          Text(url, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
            fontSize: 11, color: AppColors.primary,
          )),
          const SizedBox(height: 2),
          Text(metrics, style: GoogleFonts.plusJakartaSans(
            fontSize: 10.5, fontWeight: FontWeight.w500, color: AppColors.textSecondary,
          )),
        ])),
      ]),
    );
  }
}

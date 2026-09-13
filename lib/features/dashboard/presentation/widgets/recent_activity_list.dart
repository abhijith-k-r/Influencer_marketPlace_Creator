import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import 'activity_item_tile.dart';

/// Container with 3 activity notification rows separated by dividers.
class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          ActivityItemTile(
            icon: Icons.payments_rounded,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.pillBackground,
            content: _rich(
              'Payment credited: ',
              '₹35,000',
              ' for Urban Fitness campaign',
            ),
            subtitle: '32m ago • Lumina Auto-Escrow',
          ),
          const Divider(height: 1, color: Color(0xFFEFF4FF)),
          ActivityItemTile(
            icon: Icons.campaign_rounded,
            iconColor: AppColors.textPrimary,
            iconBgColor: const Color(0xFFDCE9FF),
            content: _rich(
              'New campaign invitation received from ',
              'GlowSkin Lab',
              '',
            ),
            subtitle: '2h ago • Beauty & Wellness',
            trailing: _buildViewButton(),
          ),
          const Divider(height: 1, color: Color(0xFFEFF4FF)),
          ActivityItemTile(
            icon: Icons.star_rounded,
            iconColor: AppColors.primary,
            iconBgColor: const Color(0xFFEFF4FF),
            content: _rich(
              'Brand rating updated: ',
              '5.0 ★',
              ' from AudioTech Pro',
            ),
            subtitle: 'Yesterday • "Outstanding turnaround"',
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'VIEW',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: AppColors.textWhite,
        ),
      ),
    );
  }

  Widget _rich(String p1, String bold, String p2) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          color: AppColors.textPrimary,
        ),
        children: [
          TextSpan(text: p1),
          TextSpan(
            text: bold,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          if (p2.isNotEmpty) TextSpan(text: p2),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// 2x2 Primary Niche selector cards (Tech, Fashion, Beauty, Gaming) matching Figma.
class PrimaryNicheGrid extends StatelessWidget {
  final String selectedNiche;
  final ValueChanged<String>? onNicheSelected;

  const PrimaryNicheGrid({
    super.key,
    this.selectedNiche = 'Tech & Gadgets',
    this.onNicheSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Primary Niche',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Select your focal industry vertical',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _card('Tech & Gadgets', 'Hardware & AI', Icons.devices_rounded)),
          const SizedBox(width: 10),
          Expanded(child: _card('Fashion & Style', 'Looks & Trends', Icons.checkroom_rounded)),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _card('Beauty & Care', 'Skincare & Glam', Icons.spa_rounded)),
          const SizedBox(width: 10),
          Expanded(child: _card('Gaming & Play', 'Streams & Clips', Icons.sports_esports_rounded)),
        ]),
      ],
    );
  }

  Widget _card(String title, String subtitle, IconData icon) {
    final isSelected = selectedNiche == title;
    return GestureDetector(
      onTap: () => onNicheSelected?.call(title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.buttonPrimary : AppColors.inputBackground,
          borderRadius: AppRadii.roundedCard,
        ),
        child: Row(children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF222222) : AppColors.surfaceWhite,
              borderRadius: AppRadii.roundedSm,
            ),
            child: Icon(icon, size: 16, color: isSelected ? AppColors.surfaceWhite : AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
                fontSize: 13, fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.surfaceWhite : AppColors.textPrimary,
              )),
              Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
                fontSize: 11, color: isSelected ? const Color(0xFFB0B3BD) : AppColors.textSecondary,
              )),
            ]),
          ),
        ]),
      ),
    );
  }
}

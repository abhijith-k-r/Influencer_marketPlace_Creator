import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// 2x2 Content Style & Tone selector matching Figma.
class ContentStyleGrid extends StatelessWidget {
  final String selectedStyle;
  final ValueChanged<String>? onStyleSelected;

  const ContentStyleGrid({
    super.key,
    this.selectedStyle = 'Aesthetic & Minimal ☕',
    this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Content Style & Tone',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'How does your production feel to viewers?',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _card('Aesthetic & Minimal ☕', 'Muted tones, clean lines, calm pacing.')),
          const SizedBox(width: 10),
          Expanded(child: _card('High Energy ⚡', 'Fast-paced cuts, vibrant voice, punchy.')),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _card('Educational 🎓', 'Data-backed, informative, thorough.')),
          const SizedBox(width: 10),
          Expanded(child: _card('Humorous 😄', 'Relatable skits, satire, playful memes.')),
        ]),
      ],
    );
  }

  Widget _card(String title, String subtitle) {
    final isSelected = selectedStyle == title;
    return GestureDetector(
      onTap: () => onStyleSelected?.call(title),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.trustBadgeBackground : AppColors.inputBackground,
          borderRadius: AppRadii.roundedCard,
          border: isSelected ? Border.all(color: AppColors.primary, width: 1) : null,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
            fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
          )),
          const SizedBox(height: 4),
          Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
            fontSize: 11, height: 1.3, color: AppColors.textSecondary,
          )),
        ]),
      ),
    );
  }
}

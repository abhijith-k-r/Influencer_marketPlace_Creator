import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Preferred Deliverables selectable list card matching Figma.
class PreferredDeliverablesList extends StatelessWidget {
  final List<String> selectedDeliverables;
  final ValueChanged<String>? onDeliverableToggled;

  const PreferredDeliverablesList({
    super.key,
    this.selectedDeliverables = const ['Shorts / Reels / TikToks', 'Long-Form Video'],
    this.onDeliverableToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('Preferred Deliverables', style: GoogleFonts.plusJakartaSans(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
        )),
        const SizedBox(height: 2),
        Text('Contract types you are actively taking on', style: GoogleFonts.plusJakartaSans(
          fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
        )),
        const SizedBox(height: 14),
        _tile('Shorts / Reels / TikToks', '15–60s portrait vertical video', Icons.smartphone_rounded),
        const SizedBox(height: 8),
        _tile('Long-Form Video', '6–15 min comprehensive review / vlog', Icons.smart_display_rounded),
        const SizedBox(height: 8),
        _tile('Photo Carousel', 'Multi-slide feed galleries with product tagged', Icons.photo_library_rounded),
        const SizedBox(height: 8),
        _tile('Dedicated Video Sponsorship', 'Entire video centered on product integration', Icons.videocam_rounded),
      ]),
    );
  }

  Widget _tile(String title, String subtitle, IconData icon) {
    final isChecked = selectedDeliverables.contains(title);
    return GestureDetector(
      onTap: () => onDeliverableToggled?.call(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: AppRadii.roundedCard,
        ),
        child: Row(children: [
          Container(
            width: 32, height: 32,
            decoration: const BoxDecoration(color: AppColors.surfaceWhite, borderRadius: AppRadii.roundedSm),
            child: Icon(icon, size: 16, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
            )),
            Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(
              fontSize: 11, color: AppColors.textSecondary,
            )),
          ])),
          const SizedBox(width: 8),
          Container(
            width: 20, height: 20,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.buttonPrimary : Colors.transparent,
              border: isChecked ? null : Border.all(color: AppColors.textPlaceholder, width: 1.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: isChecked ? const Icon(Icons.check, size: 14, color: AppColors.surfaceWhite) : null,
          ),
        ]),
      ),
    );
  }
}

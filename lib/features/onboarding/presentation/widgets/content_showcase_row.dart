import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// 3-photo visual showcase row (Unboxing, Tutorials, Reviews) matching Figma.
class ContentShowcaseRow extends StatelessWidget {
  const ContentShowcaseRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _photoCard('Unboxing', AppAssets.avatar1)),
        const SizedBox(width: 8),
        Expanded(child: _photoCard('Tutorials', AppAssets.avatar2)),
        const SizedBox(width: 8),
        Expanded(child: _photoCard('Reviews', AppAssets.avatar3)),
      ],
    );
  }

  Widget _photoCard(String label, String imageAsset) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: AppRadii.roundedCard,
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadii.roundedCard,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Color(0xCC000000)],
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.surfaceWhite,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorPitchFab extends StatelessWidget {
  final VoidCallback onPressed;

  const CreatorPitchFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: AppRadii.roundedFull,
        boxShadow: [
          BoxShadow(
            color: Color(0x4D3B46F1),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: CreatorColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        icon: const Icon(Icons.bolt_rounded, size: 20, color: Colors.white),
        label: Text(
          'Pitch Brand Direct',
          style: AppTextStyles.labelMd(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorEscrowSecurityRibbon extends StatelessWidget {
  const CreatorEscrowSecurityRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.primaryContainer,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0x33FFFFFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.verified_user_rounded, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '100% Escrow Protected Payments',
                  style: AppTextStyles.labelMd(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Funds held safely in escrow until you complete each milestone.',
                  style: AppTextStyles.labelSm(color: Colors.white.withValues(alpha: 0.85)).copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

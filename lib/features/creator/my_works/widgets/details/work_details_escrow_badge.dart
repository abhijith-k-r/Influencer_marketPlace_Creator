import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Highlighted escrow protection banner with vault lock graphic.
class WorkDetailsEscrowBadge extends StatelessWidget {
  final String amount;

  const WorkDetailsEscrowBadge({
    super.key,
    this.amount = '₹40,000',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: const BoxDecoration(
        color: CreatorColors.primaryContainer,
        borderRadius: AppRadii.roundedMd,
        boxShadow: [
          BoxShadow(
            color: Color(0x383B46F1),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: AppRadii.roundedSm,
                ),
                child: const Icon(Icons.lock_rounded, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$amount Escrow Locked',
                    style: AppTextStyles.labelMd(
                      color: CreatorColors.onPrimary,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Protected by Smart Vault',
                    style: AppTextStyles.bodySm(
                      color: CreatorColors.primaryFixed,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.verified_user_rounded,
            color: CreatorColors.primaryFixed,
            size: 20,
          ),
        ],
      ),
    );
  }
}

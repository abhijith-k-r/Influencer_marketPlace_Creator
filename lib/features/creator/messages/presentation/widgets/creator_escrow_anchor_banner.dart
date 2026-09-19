import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Top escrow status anchor banner with flex constraints to prevent overflow (<75 LOC).
class CreatorEscrowAnchorBanner extends StatelessWidget {
  final String amount;
  final String status;
  final VoidCallback onDetailsTap;

  const CreatorEscrowAnchorBanner({
    super.key,
    this.amount = '₹45,000',
    this.status = 'Escrow Deposited • Milestone 2/3',
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: CreatorColors.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.lock_rounded, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$amount in Escrow Vault',
                        style: AppTextStyles.labelSm(
                          color: Colors.white,
                        ).copyWith(fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        status,
                        style: AppTextStyles.labelSm(
                          color: Colors.white.withValues(alpha: 0.8),
                        ).copyWith(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onDetailsTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: CreatorColors.primary,
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: const Size(0, 30),
            ),
            child: Text(
              'View Milestones',
              style: AppTextStyles.labelSm(
                color: CreatorColors.primary,
              ).copyWith(fontWeight: FontWeight.w700, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

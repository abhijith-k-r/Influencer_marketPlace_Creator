import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorEscrowAnchorBanner extends StatelessWidget {
  const CreatorEscrowAnchorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: CreatorColors.primaryContainer.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.shield_rounded, size: 22, color: CreatorColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Escrow Secured Collabs',
                      style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: CreatorColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '₹1,45,000 locked in brand smart vaults • Auto-disbursal on milestone sign-off',
                  style: AppTextStyles.bodySm(color: CreatorColors.outline),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Funds are safely locked in Escrow until both parties approve deliverables.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: CreatorColors.surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.info_outline_rounded, size: 16, color: CreatorColors.outline),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class MilestoneActionBar extends StatelessWidget {
  final VoidCallback? onViewAgreement;
  final VoidCallback? onPaymentEscrow;

  const MilestoneActionBar({
    super.key,
    this.onViewAgreement,
    this.onPaymentEscrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MILESTONE VERIFICATION',
                style: AppTextStyles.labelSm(
                  color: AppColors.tertiary,
                ).copyWith(letterSpacing: 0.8),
              ),
              Text(
                'Pending Brand Signoff',
                style: AppTextStyles.labelSm(
                  color: AppColors.primary,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 2 Buttons Row
          Row(
            children: [
              // Button 1: View Agreement
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: onViewAgreement,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.surfaceContainerLowest,
                      side: const BorderSide(
                        color: AppColors.surfaceContainer,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            'View Agreement',
                            style: AppTextStyles.labelMd(
                              color: AppColors.primary,
                            ).copyWith(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Button 2: Payment Escrow
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onPaymentEscrow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shadowColor: AppColors.primary.withValues(alpha: 0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.payments_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            'Payment Escrow',
                            style: AppTextStyles.labelMd(
                              color: Colors.white,
                            ).copyWith(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

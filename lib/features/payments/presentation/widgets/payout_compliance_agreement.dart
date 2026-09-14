import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Compliance confirmation checkbox row for payout authorizations.
class PayoutComplianceAgreement extends StatelessWidget {
  final bool isAgreed;
  final ValueChanged<bool> onAgreementChanged;

  const PayoutComplianceAgreement({
    super.key,
    required this.isAgreed,
    required this.onAgreementChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAgreementChanged(!isAgreed),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              value: isAgreed,
              onChanged: (v) => onAgreementChanged(v ?? false),
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'I confirm that this reel complies with FTC disclosure guidelines (#ad) and brand safety standards.',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

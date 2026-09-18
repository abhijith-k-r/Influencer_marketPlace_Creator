import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemActionSection extends StatefulWidget {
  final VoidCallback onCompleted;
  const CreatorRedeemActionSection({super.key, required this.onCompleted});

  @override
  State<CreatorRedeemActionSection> createState() => _CreatorRedeemActionSectionState();
}

class _CreatorRedeemActionSectionState extends State<CreatorRedeemActionSection> {
  bool _isLoading = false;
  bool _isSuccess = false;

  Future<void> _handleRedeem() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF00A86B).withValues(alpha: 0.12), borderRadius: BorderRadius.circular(AppRadii.xl), border: Border.all(color: const Color(0xFF00A86B))),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: Color(0xFF00A86B), size: 32),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payout Dispatched!', style: AppTextStyles.labelLg(color: const Color(0xFF00A86B)).copyWith(fontWeight: FontWeight.w700)),
                      Text('₹1,980.00 credited • Ref: UTR-882947192', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onCompleted,
              style: ElevatedButton.styleFrom(backgroundColor: CreatorColors.primary, foregroundColor: CreatorColors.onPrimary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)), padding: const EdgeInsets.symmetric(vertical: 14)),
              child: Text('Back to Dashboard', style: AppTextStyles.labelLg(color: CreatorColors.onPrimary).copyWith(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleRedeem,
            style: ElevatedButton.styleFrom(backgroundColor: CreatorColors.primary, foregroundColor: CreatorColors.onPrimary, disabledBackgroundColor: CreatorColors.primary.withValues(alpha: 0.6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)), padding: const EdgeInsets.symmetric(vertical: 14)),
            child: _isLoading
                ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                : Text('Confirm Redeem • ₹1,980.00', style: AppTextStyles.labelLg(color: CreatorColors.onPrimary).copyWith(fontWeight: FontWeight.w700)),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, size: 14, color: CreatorColors.outline),
            const SizedBox(width: 6),
            Text('Protected by 256-Bit Escrow Vault Security', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
          ],
        ),
      ],
    );
  }
}

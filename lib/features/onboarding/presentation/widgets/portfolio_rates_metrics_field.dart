import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Baseline collaboration deliverable format & starting rate input row.
class PortfolioRatesMetricsField extends StatelessWidget {
  final TextEditingController? rateController;

  const PortfolioRatesMetricsField({super.key, this.rateController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Typical Deliverable & Starting Rate',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'STARTING BASELINE',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.66, color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: AppRadii.roundedInput,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  '🎥 Dedicated Video',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 4,
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: AppRadii.roundedInput,
                ),
                child: Row(
                  children: [
                    Text(r'$', style: GoogleFonts.plusJakartaSans(
                      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textSecondary,
                    )),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextFormField(
                        controller: rateController,
                        initialValue: rateController == null ? '1,850' : null,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Text('USD', style: GoogleFonts.plusJakartaSans(
                      fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.textPlaceholder,
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

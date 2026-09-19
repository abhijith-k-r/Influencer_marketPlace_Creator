import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';

/// Escrow auto-disbursement toggle card on the Brand Profile screen.
class BrandEscrowPreferenceCard extends StatelessWidget {
  final dynamic profile;

  const BrandEscrowPreferenceCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    size: 20,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Escrow Auto-Disbursement',
                        style: AppTextStyles.labelLg(color: AppColors.onSurface)
                            .copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Funds released upon campaign draft sign-off',
                        style: AppTextStyles.bodySm(color: AppColors.tertiary),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Switch(
            value: profile.autoDisbursementEnabled,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor:
                AppColors.tertiaryContainer.withValues(alpha: 0.5),
            onChanged: (val) => context
                .read<ProfileBloc>()
                .add(ToggleAutoDisbursementEvent(val)),
          ),
        ],
      ),
    );
  }
}

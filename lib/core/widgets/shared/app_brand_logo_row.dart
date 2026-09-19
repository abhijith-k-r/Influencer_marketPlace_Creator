import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// The "COLLABCONNECT / [pageTitle]" logo + title header row used across
/// Brand side app bars (Home, Messages, etc.).
class AppBrandLogoRow extends StatelessWidget {
  final String pageTitle;

  const AppBrandLogoRow({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            AppAssets.collabConnectLogo,
            width: 34,
            height: 34,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const Icon(
              Icons.handshake_rounded,
              color: AppColors.primary,
              size: 26,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'COLLABCONNECT',
              style: AppTextStyles.labelSm(color: AppColors.primary).copyWith(
                letterSpacing: 0.8,
                fontWeight: FontWeight.w800,
                fontSize: 10,
              ),
            ),
            Text(
              pageTitle,
              style: AppTextStyles.headlineSm(
                color: AppColors.onSurface,
              ).copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ],
    );
  }
}

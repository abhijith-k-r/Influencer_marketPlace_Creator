import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

/// User avatar with bolt indicator badge.
class GreetingAvatarBadge extends StatelessWidget {
  const GreetingAvatarBadge({super.key});

  static const String _avatarUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDaHiGIQCmp8HU54u7ljlZ5WAnjzGrnXJqnivdCMgvXTscwzfWGVq6LHpH3XPTQpiW5-Z6XY6OR5C1dsBesr6jRKkuD4617Xh2pr75bknvy2QkqyrBBKootR7U52mkLQeBrcSmW1JNTU6OOD2x5qmg5bcxjSfMcNZCC3RnH92_v49l7MHwluD0XQ1O59skJhwbCbC-xr_B_0kfNaPOqTxSJm25-TsUOQYTKWFeSRUQojLhh4vUk0Dwr';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Image.network(
            _avatarUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Image.asset(
              AppAssets.avatar1,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.surfaceWhite, width: 2),
            ),
            child: const Icon(
              Icons.bolt_rounded,
              size: 10,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ],
    );
  }
}

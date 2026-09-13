import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// 44x44 rounded brand avatar thumbnail with active indicator dot.
class BrandAvatarBadge extends StatelessWidget {
  const BrandAvatarBadge({super.key});

  static const String _logoUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAOVDE59B5rDscjeQodcJEi2arVSCxKwaGYf_TrOC9R_oLm6EgXYVDJvaj4YUdtE1Qw1ZSqSlubMkaPRdFKL_s215amooB7mp29KA_cWWykWkWxws0FtzQuqS1r78YST8NegXtmNeK1lCeg6LVE-G_GNyzD3OimlVVxAHGApszyo7KNY8hI5CocMjHA5u-RdwWBxN3MMUxdGQwweZwPBl_td2fHxU5_RP1Xm5n0jkKntLkQnOrbFSQk';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFD3E4FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              _logoUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const Icon(
                Icons.headphones_rounded,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.surfaceWhite, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// App bar / subheader for Creator Work Details view.
class WorkDetailsAppBar extends StatelessWidget {
  final VoidCallback onBack;

  const WorkDetailsAppBar({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleButton(
            icon: Icons.arrow_back_rounded,
            onPressed: onBack,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DEAL DETAILS',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.primary,
                ).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w700),
              ),
              Text(
                'Work Details',
                style: AppTextStyles.headlineSm(
                  color: CreatorColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCircleButton(
                icon: Icons.ios_share_rounded,
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              _buildCircleButton(
                icon: Icons.more_vert_rounded,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: CreatorColors.onSurface),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

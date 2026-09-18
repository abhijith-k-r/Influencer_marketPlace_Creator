import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorChatThreadHeader extends StatelessWidget {
  final String title;

  const CreatorChatThreadHeader({super.key, this.title = 'Chat Thread'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: CreatorColors.surface.withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(
            color: CreatorColors.surfaceContainerHigh.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: CreatorColors.onSurface),
              ),
              Text(
                title,
                style: AppTextStyles.headlineMd(color: CreatorColors.onSurface),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded, size: 22, color: CreatorColors.outline),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: CreatorColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_rounded, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}

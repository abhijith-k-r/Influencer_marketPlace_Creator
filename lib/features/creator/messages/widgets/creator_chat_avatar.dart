import 'package:flutter/material.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorChatAvatar extends StatelessWidget {
  final String avatarUrl;
  final bool isVerified;

  const CreatorChatAvatar({super.key, required this.avatarUrl, this.isVerified = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            avatarUrl,
            width: 46,
            height: 46,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 46,
              height: 46,
              color: CreatorColors.surfaceContainerHigh,
              child: const Icon(Icons.storefront_rounded, color: CreatorColors.primary),
            ),
          ),
        ),
        if (isVerified)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: CreatorColors.primary, shape: BoxShape.circle),
              child: const Icon(Icons.verified_rounded, size: 12, color: Colors.white),
            ),
          ),
      ],
    );
  }
}

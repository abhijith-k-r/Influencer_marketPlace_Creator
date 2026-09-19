import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Global avatar component supporting network URLs, asset fallback, online dot, and initials.
class AppNetworkAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final bool isOnline;
  final String? initials;
  final IconData fallbackIcon;
  final VoidCallback? onTap;

  const AppNetworkAvatar({
    super.key,
    this.imageUrl,
    this.radius = 20,
    this.isOnline = false,
    this.initials,
    this.fallbackIcon = Icons.person_rounded,
    this.onTap,
  });

  ImageProvider? _resolveImage() {
    if (imageUrl == null || imageUrl!.isEmpty) return null;
    if (imageUrl!.startsWith('http://') || imageUrl!.startsWith('https://')) {
      return NetworkImage(imageUrl!);
    }
    return AssetImage(imageUrl!);
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = _resolveImage();

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: CreatorColors.surfaceContainerHigh,
      backgroundImage: imageProvider,
      child: imageProvider == null
          ? (initials != null && initials!.isNotEmpty
              ? Text(
                  initials!,
                  style: TextStyle(
                    fontSize: radius * 0.8,
                    fontWeight: FontWeight.w700,
                    color: CreatorColors.primary,
                  ),
                )
              : Icon(fallbackIcon, size: radius * 1.1, color: CreatorColors.primary))
          : null,
    );

    if (isOnline) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.55,
              height: radius * 0.55,
              decoration: BoxDecoration(
                color: const Color(0xFF00A86B),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
        ],
      );
    }

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: avatar,
      );
    }

    return avatar;
  }
}

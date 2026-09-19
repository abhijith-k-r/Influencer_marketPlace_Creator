import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Adapter widget delegating to the global AppNetworkAvatar design component.
class CreatorChatAvatar extends StatelessWidget {
  final String? avatarUrl;
  final bool isOnline;
  final double radius;

  const CreatorChatAvatar({
    super.key,
    this.avatarUrl,
    this.isOnline = false,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return AppNetworkAvatar(
      imageUrl: avatarUrl,
      isOnline: isOnline,
      radius: radius,
      fallbackIcon: Icons.business_rounded,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Message input pill bar with attachment, voice note, and send actions.
class MessageInputBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend;

  const MessageInputBar({super.key, this.controller, this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground.withValues(alpha: 0.95),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: AppRadii.roundedPill,
            boxShadow: AppShadows.floating,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.attach_file_rounded,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: AppTextStyles.fieldInput,
                  decoration: InputDecoration(
                    hintText: 'Type your message to Sony Audio...',
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPlaceholder,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_rounded,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.buttonPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    size: 18,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

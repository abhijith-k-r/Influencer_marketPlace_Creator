import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/chat_message_model.dart';

class ChatVideoAttachment extends StatelessWidget {
  final ChatMessageModel message;
  final VoidCallback? onPlay;
  final VoidCallback? onDownload;

  const ChatVideoAttachment({
    super.key,
    required this.message,
    this.onPlay,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.88,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: Column(
                  children: [
                    // Video Preview with Play Button
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 176,
                          width: double.infinity,
                          child: Image.network(
                            message.videoThumbnailUrl ??
                                AppAssets.reelVideoThumbnail,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: AppColors.inverseSurface,
                              child: const Icon(
                                Icons.videocam,
                                size: 48,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                        // Dark overlay gradient
                        Container(
                          height: 176,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.2),
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.6),
                              ],
                            ),
                          ),
                        ),

                        // Play Button
                        InkWell(
                          onTap: onPlay,
                          borderRadius: AppRadii.roundedPill,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                              color: AppColors.primary,
                            ),
                          ),
                        ),

                        // Duration Badge (Bottom Left)
                        Positioned(
                          bottom: 10,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.inverseSurface.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              message.videoDuration ?? '0:42 • 4K 60fps',
                              style: AppTextStyles.labelSm(
                                color: AppColors.inverseOnSurface,
                              ),
                            ),
                          ),
                        ),

                        // Draft Pill (Top Right)
                        Positioned(
                          top: 10,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: AppRadii.roundedPill,
                            ),
                            child: Text(
                              message.videoBadge ?? 'Draft v1',
                              style: AppTextStyles.labelSm(
                                color: AppColors.onSecondary,
                              ).copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // File Info Strip
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.movie_rounded,
                                  size: 20,
                                  color: AppColors.secondary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message.videoFileName ??
                                        'Draft_Reel_v1.mp4',
                                    style: AppTextStyles.labelMd(
                                      color: AppColors.onSurface,
                                    ).copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    message.videoFileSize ??
                                        '48 MB • Ready for review',
                                    style: AppTextStyles.bodySm(
                                      color: AppColors.tertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: onDownload,
                            borderRadius: AppRadii.roundedPill,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                color: AppColors.surfaceContainerLow,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.download_rounded,
                                size: 20,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                message.timestamp,
                style: AppTextStyles.labelSm(
                  color: AppColors.tertiary,
                ).copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/message_thread_model.dart';
import 'deal_avatar.dart';
import 'inbound_action_buttons.dart';

/// Inbound partnership pitch request card with quote box and response actions.
class BrandInboundRequestCard extends StatelessWidget {
  final MessageThreadModel thread;
  final VoidCallback onViewBrief;
  final VoidCallback onAcceptReply;

  const BrandInboundRequestCard({
    super.key,
    required this.thread,
    required this.onViewBrief,
    required this.onAcceptReply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: AppColors.borderLight, width: 0.8),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DealAvatar(avatarUrl: thread.avatarUrl, brandName: thread.brandName, isVerified: thread.isVerified),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            thread.brandName,
                            style: AppTextStyles.h4.copyWith(fontSize: 15),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          thread.time,
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('${thread.contactName} • ${thread.contactRole}', style: AppTextStyles.bodySmall),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                      ),
                      child: Text(
                        thread.inboundQuote ?? thread.lastMessage,
                        style: AppTextStyles.bodySmall.copyWith(height: 1.45, color: AppColors.textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InboundActionButtons(onViewBrief: onViewBrief, onAcceptReply: onAcceptReply),
        ],
      ),
    );
  }
}

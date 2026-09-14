import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../data/models/message_thread_model.dart';
import 'deal_avatar.dart';
import 'deal_content_body.dart';

/// Interactive deal card representing an active campaign collaboration.
class ActiveDealCard extends StatelessWidget {
  final MessageThreadModel thread;
  final VoidCallback onTap;

  const ActiveDealCard({
    super.key,
    required this.thread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: Border.all(color: AppColors.borderLight, width: 0.8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              if (thread.isUnread)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppRadii.lg),
                        bottomLeft: Radius.circular(AppRadii.lg),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DealAvatar(
                      avatarUrl: thread.avatarUrl,
                      brandName: thread.brandName,
                      isVerified: thread.isVerified,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DealContentBody(thread: thread),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

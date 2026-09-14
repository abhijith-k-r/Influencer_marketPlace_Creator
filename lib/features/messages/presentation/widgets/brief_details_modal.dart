import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/message_thread_model.dart';
import 'deal_avatar.dart';

/// Modal bottom sheet displaying detailed campaign pitch and scope for an inbound inquiry.
class BriefDetailsModal extends StatelessWidget {
  final MessageThreadModel thread;
  final VoidCallback onAccept;

  const BriefDetailsModal({super.key, required this.thread, required this.onAccept});

  static Future<void> show(BuildContext context, {
    required MessageThreadModel thread,
    required VoidCallback onAccept,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BriefDetailsModal(thread: thread, onAccept: onAccept),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.lg)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: AppColors.borderLight, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                DealAvatar(avatarUrl: thread.avatarUrl, brandName: thread.brandName, isVerified: thread.isVerified),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(thread.brandName, style: AppTextStyles.h4),
                      Text(thread.campaignName, style: AppTextStyles.bodySmall),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.pillBackground, borderRadius: BorderRadius.circular(AppRadii.pill)),
                  child: Text(thread.dealAmount, style: AppTextStyles.brandPill),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Campaign Pitch & Deliverable Scope', style: AppTextStyles.fieldLabel),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(AppRadii.sm)),
              child: Text(thread.inboundQuote ?? thread.lastMessage, style: AppTextStyles.body),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  onAccept();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  foregroundColor: AppColors.textWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
                ),
                icon: const Icon(Icons.send_rounded, size: 16),
                label: const Text('Accept & Start Conversation', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

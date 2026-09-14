import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/message_thread_model.dart';
import 'brand_inbound_request_card.dart';

/// Section listing brand inbound inquiries and seeding pitches.
class BrandInboundsSection extends StatelessWidget {
  final List<MessageThreadModel> inbounds;
  final ValueChanged<MessageThreadModel> onViewBrief;
  final ValueChanged<MessageThreadModel> onAcceptReply;

  const BrandInboundsSection({
    super.key,
    required this.inbounds,
    required this.onViewBrief,
    required this.onAcceptReply,
  });

  @override
  Widget build(BuildContext context) {
    if (inbounds.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.move_to_inbox_rounded,
                  size: 20,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Brand Inbound Requests',
                  style: AppTextStyles.h4.copyWith(fontSize: 15),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
              decoration: BoxDecoration(
                color: AppColors.liveBadgeBackground,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
              child: Text(
                '${inbounds.length} New',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: inbounds.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final req = inbounds[index];
            return BrandInboundRequestCard(
              thread: req,
              onViewBrief: () => onViewBrief(req),
              onAcceptReply: () => onAcceptReply(req),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../models/creator_work_item.dart';
import 'my_works_card_footer.dart';
import 'my_works_card_header.dart';
import 'my_works_card_meta.dart';

/// Campaign collaboration card shown in the My Works list screen.
class MyWorksCard extends StatelessWidget {
  final CreatorWorkItem item;
  final VoidCallback onTap;

  const MyWorksCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadii.roundedXl,
        child: InkWell(
          borderRadius: AppRadii.roundedXl,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyWorksCardHeader(item: item),
                const SizedBox(height: 12),
                MyWorksCardMeta(item: item),
                const SizedBox(height: 12),
                MyWorksCardFooter(item: item, onTap: onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

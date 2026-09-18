import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorPaymentDetailsHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CreatorPaymentDetailsHeader({
    super.key,
    this.title = 'Payment Details',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CreatorColors.surfaceContainerLowest,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        color: CreatorColors.onSurface,
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        title,
        style: AppTextStyles.headlineMd(
          color: CreatorColors.onSurface,
        ).copyWith(fontWeight: FontWeight.w700),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined, size: 20),
          color: CreatorColors.onSurfaceVariant,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment escrow link copied to clipboard'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.download_rounded, size: 22),
          color: CreatorColors.onSurfaceVariant,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Downloading verified escrow agreement (PDF)...'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ],
    );
  }
}

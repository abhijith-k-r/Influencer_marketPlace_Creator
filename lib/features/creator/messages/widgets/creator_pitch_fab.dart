import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorPitchFab extends StatelessWidget {
  final VoidCallback? onPressed;

  const CreatorPitchFab({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Direct Pitch Outreach: Select a brand to compose a tailored proposal.'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: CreatorColors.primary,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: CreatorColors.primary.withValues(alpha: 0.35),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.edit_note_rounded, size: 20, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Pitch Brand',
              style: AppTextStyles.labelLg(color: Colors.white).copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

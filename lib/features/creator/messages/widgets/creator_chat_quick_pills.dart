import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorChatQuickPills extends StatelessWidget {
  const CreatorChatQuickPills({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildPill(Icons.description_rounded, 'View Agreement', false),
          const SizedBox(width: 8),
          _buildPill(Icons.shield_rounded, 'Milestone Escrow Status', true),
          const SizedBox(width: 8),
          _buildPill(Icons.checklist_rounded, 'Deliverables (4/5)', false),
        ],
      ),
    );
  }

  Widget _buildPill(IconData icon, String label, bool isPrimary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimary ? CreatorColors.primary : CreatorColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: isPrimary ? Colors.white : CreatorColors.primary),
          const SizedBox(width: 5),
          Text(label, style: AppTextStyles.labelSm(color: isPrimary ? Colors.white : CreatorColors.primary).copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

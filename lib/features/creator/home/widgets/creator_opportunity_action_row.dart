import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorOpportunityActionRow extends StatefulWidget {
  final String brandName;

  const CreatorOpportunityActionRow({super.key, required this.brandName});

  @override
  State<CreatorOpportunityActionRow> createState() => _CreatorOpportunityActionRowState();
}

class _CreatorOpportunityActionRowState extends State<CreatorOpportunityActionRow> {
  bool _isApplied = false;
  bool _isSaved = false;

  void _handleApply() {
    if (_isApplied) return;
    setState(() => _isApplied = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CreatorColors.onSurface,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            const Icon(Icons.send_rounded, color: CreatorColors.primaryFixed, size: 18),
            const SizedBox(width: 8),
            Text('Pitch sent to ${widget.brandName}', style: AppTextStyles.labelMd(color: Colors.white)),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => setState(() => _isSaved = !_isSaved),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              children: [
                Icon(_isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded, size: 18, color: _isSaved ? CreatorColors.primary : CreatorColors.outline),
                const SizedBox(width: 4),
                Text('Save', style: AppTextStyles.labelMd(color: _isSaved ? CreatorColors.primary : CreatorColors.outline)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: _handleApply,
          borderRadius: BorderRadius.circular(24),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: _isApplied ? CreatorColors.primary : CreatorColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Text(_isApplied ? 'Applied!' : 'Apply Now', style: AppTextStyles.labelLg(color: _isApplied ? Colors.white : CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(width: 4),
                Icon(_isApplied ? Icons.check_circle_rounded : Icons.arrow_forward_rounded, size: 16, color: _isApplied ? Colors.white : CreatorColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

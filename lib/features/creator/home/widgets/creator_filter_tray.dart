import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorFilterTray extends StatefulWidget {
  final Set<String> initialSelected;
  final ValueChanged<Set<String>>? onChanged;

  const CreatorFilterTray({
    super.key,
    this.initialSelected = const {'₹50K–₹1L', '2 Months', 'Fashion & Streetwear'},
    this.onChanged,
  });

  @override
  State<CreatorFilterTray> createState() => _CreatorFilterTrayState();
}

class _CreatorFilterTrayState extends State<CreatorFilterTray> {
  late final Set<String> _selected = Set.from(widget.initialSelected);

  static const List<String> _chips = [
    '₹50K–₹1L',
    '₹10K–₹50K',
    '₹1L+',
    '2 Months',
    'Fitness & Health',
    'Fashion & Streetwear',
    'Tech & Gadgets',
    'Instagram Reel',
    'YouTube',
  ];

  void _toggle(String chip) {
    setState(() {
      if (_selected.contains(chip)) {
        _selected.remove(chip);
      } else {
        _selected.add(chip);
      }
    });
    widget.onChanged?.call(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final chip = _chips[index];
          final isSelected = _selected.contains(chip);

          return InkWell(
            onTap: () => _toggle(chip),
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? CreatorColors.primaryContainer : CreatorColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? CreatorColors.primaryContainer.withValues(alpha: 0.28) : const Color(0x060B1C30),
                    blurRadius: isSelected ? 10 : 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chip,
                    style: AppTextStyles.labelMd(color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant),
                  ),
                  if (isSelected) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.check_rounded, size: 14, color: Colors.white),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

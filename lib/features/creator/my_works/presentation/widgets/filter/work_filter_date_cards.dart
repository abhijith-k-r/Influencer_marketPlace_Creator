import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Timeline Window date range presets and dual date cards selector.
class WorkFilterDateCards extends StatelessWidget {
  final String activePreset;
  final ValueChanged<String> onSelectPreset;

  static const List<String> presets = ['All Time', 'This Month', 'Last 30 Days', 'Q4 2024'];
  const WorkFilterDateCards({super.key, required this.activePreset, required this.onSelectPreset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Timeline Window', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
              Text('Q4 Range', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: presets.map((p) {
                final isSel = p == activePreset;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () => onSelectPreset(p),
                    borderRadius: AppRadii.roundedFull,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSel ? CreatorColors.primaryContainer : CreatorColors.surfaceContainerLow,
                        borderRadius: AppRadii.roundedFull,
                      ),
                      child: Text(p, style: AppTextStyles.labelMd(color: isSel ? Colors.white : CreatorColors.onSurfaceVariant)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildDateCard('START DATE', '01 Oct 2024', 'Tuesday • Week 40', Icons.calendar_today_rounded)),
              const SizedBox(width: 10),
              Expanded(child: _buildDateCard('END DATE', '31 Dec 2024', 'Tuesday • Quarter Close', Icons.event_available_rounded)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateCard(String label, String date, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(label, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant).copyWith(fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis),
              ),
              Icon(icon, size: 16, color: CreatorColors.primary),
            ],
          ),
          const SizedBox(height: 4),
          Text(date, style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
          Text(subtitle, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant).copyWith(fontSize: 10)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProfileAnalyticsMatrix extends StatelessWidget {
  const ProfileAnalyticsMatrix({super.key});

  static const List<Map<String, dynamic>> _metrics = [
    {'title': 'Total Reach', 'value': '471K', 'badge': '+12%', 'badgeColor': Color(0xFF059669)},
    {'title': 'Engagement Rate', 'value': '5.8%', 'badge': 'Top 5%', 'badgeColor': Color(0xFF4F46E5)},
    {'title': 'Avg Reel Views', 'value': '64.2K', 'badge': 'Verified', 'badgeColor': Color(0xFF059669)},
    {'title': 'Avg Likes', 'value': '4.8K', 'badge': 'Organic', 'badgeColor': Color(0xFF6B7280)},
    {'title': 'Avg Comments', 'value': '340', 'badge': 'High Convo', 'badgeColor': Color(0xFF4F46E5)},
    {'title': 'On-Time Rate', 'value': '100%', 'badge': '24/24 Wins', 'badgeColor': Color(0xFF059669)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('Performance Matrix', style: AppTextStyles.h4),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _metrics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.0,
          ),
          itemBuilder: (context, index) {
            final m = _metrics[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        m['title'] as String,
                        style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 11),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: (m['badgeColor'] as Color).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          m['badge'] as String,
                          style: TextStyle(
                            color: m['badgeColor'] as Color,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    m['value'] as String,
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

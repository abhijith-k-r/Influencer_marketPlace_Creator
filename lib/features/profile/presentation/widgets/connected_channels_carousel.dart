import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ConnectedChannelsCarousel extends StatelessWidget {
  const ConnectedChannelsCarousel({super.key});

  static const List<Map<String, dynamic>> _channels = [
    {
      'platform': 'Instagram',
      'handle': '@alexcreates',
      'stat': '145K',
      'substat': '5.8% ER',
      'color': Color(0xFFE1306C),
      'icon': Icons.camera_alt_outlined,
    },
    {
      'platform': 'YouTube',
      'handle': 'AlexRiveraTech',
      'stat': '82K',
      'substat': '42K Views',
      'color': Color(0xFFFF0000),
      'icon': Icons.play_arrow_rounded,
    },
    {
      'platform': 'TikTok',
      'handle': '@alexcreates',
      'stat': '210K',
      'substat': '6.4% ER',
      'color': Color(0xFF000000),
      'icon': Icons.music_note_rounded,
    },
    {
      'platform': 'Facebook',
      'handle': 'Alex Rivera',
      'stat': '34K',
      'substat': 'Followers',
      'color': Color(0xFF1877F2),
      'icon': Icons.public_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('Connected Channels', style: AppTextStyles.h4),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _channels.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final c = _channels[index];
              return Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(c['icon'] as IconData, color: c['color'] as Color, size: 18),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            c['platform'] as String,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      c['stat'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    Text(
                      c['substat'] as String,
                      style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

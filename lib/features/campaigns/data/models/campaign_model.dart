import 'package:equatable/equatable.dart';

/// Data model representing a Brand Sponsorship Campaign.
class CampaignModel extends Equatable {
  final String id;
  final String brandName;
  final String title;
  final String category;
  final String payout;
  final String deadline;
  final String platform;
  final List<String> deliverables;
  final String description;

  const CampaignModel({
    required this.id,
    required this.brandName,
    required this.title,
    required this.category,
    required this.payout,
    required this.deadline,
    required this.platform,
    required this.deliverables,
    required this.description,
  });

  static const List<CampaignModel> sampleCampaigns = [
    CampaignModel(
      id: 'cmp-1',
      brandName: 'Sony Audio',
      title: 'Flagship ANC Headphones Creator Showcase',
      category: 'Tech',
      payout: '\$2,500',
      deadline: '4 days left',
      platform: 'YouTube',
      deliverables: [
        '1x Dedicated 8-10 min Video Review',
        '2x Instagram Stories with Swipe-up Link',
      ],
      description:
          'Highlight sound quality, multi-device pairing, and 30-hour battery life in your daily tech workflow.',
    ),
    CampaignModel(
      id: 'cmp-2',
      brandName: 'Anker Innovations',
      title: 'GaNPrime Fast Charger Ecosystem',
      category: 'Tech',
      payout: '\$1,800',
      deadline: '6 days left',
      platform: 'Instagram',
      deliverables: [
        '1x 60s High-Energy Reel',
        '3x High-Res Still Photos for Brand Usage',
      ],
      description:
          'Demonstrate multi-device charging for laptop, phone, and tablet simultaneously.',
    ),
    CampaignModel(
      id: 'cmp-3',
      brandName: 'Nord Security',
      title: 'Cybersecurity Month Sponsorship',
      category: 'Lifestyle',
      payout: '\$2,200',
      deadline: '8 days left',
      platform: 'TikTok',
      deliverables: [
        '2x 45s TikTok Videos highlighting public Wi-Fi security',
        'Custom affiliate discount code promo',
      ],
      description:
          'Create relatable scenarios explaining why a VPN is essential when traveling or working in cafes.',
    ),
  ];

  @override
  List<Object?> get props => [
    id,
    brandName,
    title,
    category,
    payout,
    deadline,
    platform,
    deliverables,
    description,
  ];
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

/// Thumbnail, brand title, deal amount, and status for campaign spotlight.
class CampaignInfoRow extends StatelessWidget {
  const CampaignInfoRow({super.key});

  static const String _imageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDKo9DKGA1lGfHSXxNR27BOHYcsyf8un3CI4oWQSxM8CN2NRzSsXxWyVfa9MfJoMDKduaTbgXxzVMMuLdLzX4B-KotYJYG-uIpq4GPN_2-3SS5Ot-pnaom_dkOyXAHWYbP5XUif5S6vqEDY-NYouG09YvdYHu9nSzRHVN4WLgYwtgF-_6CaamdhJHLxo1uwFpVL8wS8_uTWId-_q5477OE3qWnnsQK_WG4BDqX9m5PtpmdspEYzzNJT';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            _imageUrl,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 64,
              height: 64,
              color: AppColors.inputBackground,
              child: const Icon(Icons.watch_rounded, color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nordic Watch Co.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  _buildPricePill('₹85,000'),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Autumn Launch & Lookbook',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(
                    Icons.hourglass_top_rounded,
                    size: 14,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Awaiting brand review',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricePill(String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9FF),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        price,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

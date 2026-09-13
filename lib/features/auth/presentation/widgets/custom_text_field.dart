import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Highly reusable styled text input with label, prefix icon, and optional actions.
class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String prefixIcon;
  final bool isRequired;
  final bool obscureText;
  final Widget? trailing;
  final Widget? labelTrailing;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.prefixIcon,
    this.isRequired = true,
    this.obscureText = false,
    this.trailing,
    this.labelTrailing,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: label,
                style: AppTextStyles.fieldLabel,
                children: [
                  if (isRequired)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: AppColors.primary),
                    ),
                ],
              ),
            ),
            ?labelTrailing,
          ],
        ),
        AppSpacing.verticalSm,
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: const BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: AppRadii.roundedMd,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                prefixIcon,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              AppSpacing.horizontalMd,
              Expanded(
                child: TextField(
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                  style: AppTextStyles.fieldInput,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: AppTextStyles.fieldPlaceholder,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                ),
              ),
              ?trailing,
            ],
          ),
        ),
      ],
    );
  }
}

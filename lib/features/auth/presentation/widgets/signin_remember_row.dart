import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Remember this device toggle row with fast pass indicator.
class SigninRememberRow extends StatelessWidget {
  final bool rememberDevice;
  final VoidCallback onToggle;

  const SigninRememberRow({
    super.key,
    required this.rememberDevice,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: onToggle,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: rememberDevice,
                  onChanged: (_) => onToggle(),
                  activeColor: AppColors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Flexible(
                  child: Text(
                    AppStrings.rememberDevice,
                    style: AppTextStyles.body,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(AppStrings.fastSecurePass, style: AppTextStyles.brandPill),
      ],
    );
  }
}

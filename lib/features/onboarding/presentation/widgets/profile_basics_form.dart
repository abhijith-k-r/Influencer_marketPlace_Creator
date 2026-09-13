import 'package:flutter/material.dart';
import 'phone_number_input_field.dart';
import 'profile_action_buttons.dart';
import 'profile_brand_name_field.dart';
import 'profile_location_field.dart';
import 'profile_basics_tip_box.dart';
import 'public_handle_input_field.dart';

/// Form inputs group and action CTAs matching Figma 2:201.
class ProfileBasicsForm extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback? onSaveLater;

  const ProfileBasicsForm({
    super.key,
    required this.onContinue,
    this.onSaveLater,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ProfileBrandNameField(),
        const SizedBox(height: 16),
        const PublicHandleInputField(),
        const SizedBox(height: 16),
        const PhoneNumberInputField(),
        const SizedBox(height: 16),
        const ProfileLocationField(),
        const SizedBox(height: 16),
        const ProfileBasicsTipBox(),
        const SizedBox(height: 16),
        ProfileActionButtons(
          onContinue: onContinue,
          onSaveLater: onSaveLater,
        ),
      ],
    );
  }
}

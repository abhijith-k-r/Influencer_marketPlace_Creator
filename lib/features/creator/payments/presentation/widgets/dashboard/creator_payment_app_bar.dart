import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/creator/creator_section_app_bar.dart';

class CreatorPaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreatorPaymentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return const CreatorSectionAppBar(
      title: 'Payment',
      subtitle: 'Studio',
      leadingIcon: Icons.bolt_rounded,
    );
  }
}

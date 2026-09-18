import 'package:flutter/material.dart';
import '../../../../core/theme/creator_colors.dart';
import 'creator_drawer_actions.dart';
import 'creator_drawer_header.dart';
import 'creator_drawer_links.dart';

class CreatorSideDrawer extends StatelessWidget {
  final VoidCallback? onClose;

  const CreatorSideDrawer({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CreatorColors.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreatorDrawerHeader(onClose: onClose),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CreatorDrawerActions(),
                      SizedBox(height: 20),
                      CreatorDrawerLinks(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

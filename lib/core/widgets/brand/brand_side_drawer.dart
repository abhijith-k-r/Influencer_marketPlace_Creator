import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'drawer/brand_drawer_auth_actions.dart';
import 'drawer/brand_drawer_escrow_footer.dart';
import 'drawer/brand_drawer_header.dart';
import 'drawer/brand_drawer_links.dart';

/// Side navigation drawer for Brand portal, assembled from modular components.
class BrandSideDrawer extends StatelessWidget {
  final VoidCallback? onClose;

  const BrandSideDrawer({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surfaceContainerLowest,
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
              BrandDrawerHeader(
                onClose: () {
                  if (onClose != null) {
                    onClose!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrandDrawerAuthActions(),
                      SizedBox(height: 24),
                      BrandDrawerLinks(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const BrandDrawerEscrowFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

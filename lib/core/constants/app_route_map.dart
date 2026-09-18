import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/auth_bottom_sheet.dart';
import '../../features/campaigns/presentation/views/brand_campaign_creation_screen.dart';
import '../../features/campaigns/presentation/views/brand_campaign_details_screen.dart';
import '../../features/campaigns/presentation/views/brand_campaign_filter_screen.dart';
import '../../features/campaigns/presentation/views/brand_campaign_list_screen.dart';
import '../../features/chat/presentation/views/individual_chat_screen.dart';
import '../../features/payments/presentation/views/brand_payment_dashboard_screen.dart';
import '../../features/payments/presentation/views/brand_payment_details_screen.dart';
import '../../features/payments/presentation/views/brand_payment_filter_screen.dart';
import '../../features/role_selection/presentation/views/role_selection_screen.dart';
import '../../features/shell/presentation/views/brand_main_shell.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import 'app_routes.dart';

/// Centralized map of application named routes to page builder widgets.
final Map<String, WidgetBuilder> appRouteMap = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.roleSelection: (_) => const RoleSelectionScreen(),
  AppRoutes.brandShell: (_) => const BrandMainShell(),
  AppRoutes.chatDetail: (_) => const IndividualChatScreen(),
  AppRoutes.auth: (_) => const AuthBottomSheet(),
  AppRoutes.paymentDashboard: (_) => const BrandPaymentDashboardScreen(),
  AppRoutes.paymentDetails: (_) => const BrandPaymentDetailsScreen(),
  AppRoutes.paymentFilter: (_) => const BrandPaymentFilterScreen(),
  AppRoutes.campaignList: (_) => const BrandCampaignListScreen(),
  AppRoutes.campaignCreate: (_) => const BrandCampaignCreationScreen(),
  AppRoutes.campaignFilter: (_) => const BrandCampaignFilterScreen(),
  AppRoutes.campaignDetails: (_) => const BrandCampaignDetailsScreen(),
};

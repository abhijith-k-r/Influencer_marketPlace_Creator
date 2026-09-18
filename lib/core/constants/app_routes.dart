/// Centralized named route identifiers for app-wide navigation.
abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String roleSelection = '/role_selection';
  static const String brandShell = '/brand_shell';
  static const String creatorShell = '/creator_shell';
  static const String chatDetail = '/chat_detail';
  static const String creatorChatDetail = '/creator_chat_detail';
  static const String auth = '/auth';

  static const String paymentDashboard = '/payment_dashboard';
  static const String paymentDetails = '/payment_details';
  static const String paymentFilter = '/payment_filter';
  static const String creatorPaymentDetails = '/creator_payment_details';
  static const String creatorPaymentRedeem = '/creator_payment_redeem';
  static const String creatorWorkDetails = '/creator_work_details';
  static const String creatorWorkFilter = '/creator_work_filter';

  static const String campaignList = '/campaign_list';
  static const String campaignCreate = '/campaign_create';
  static const String campaignFilter = '/campaign_filter';
  static const String campaignDetails = '/campaign_details';

  // Backward-compatibility route aliases
  static const String signup = auth;
  static const String signin = auth;
  static const String messages = chatDetail;
  static const String requestPayment = paymentDashboard;
}

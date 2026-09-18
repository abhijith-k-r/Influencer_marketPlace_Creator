/// Centralized named route identifiers for app-wide navigation.
abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String roleSelection = '/role_selection';
  static const String brandShell = '/brand_shell';
  static const String chatDetail = '/chat_detail';
  static const String auth = '/auth';

  static const String paymentDashboard = '/payment_dashboard';
  static const String paymentDetails = '/payment_details';
  static const String paymentFilter = '/payment_filter';

  // Backward-compatibility route aliases
  static const String signup = auth;
  static const String signin = auth;
  static const String messages = chatDetail;
  static const String requestPayment = paymentDashboard;
}

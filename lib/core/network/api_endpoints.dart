/// Centralized registry of backend API endpoint URLs and routes.
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.collabconnect.app/v1';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  static const String refreshToken = '/auth/refresh';

  // Creator endpoints
  static const String creatorProfile = '/creator/profile';
  static const String creatorOpportunities = '/creator/opportunities';
  static const String creatorWorks = '/creator/works';
  static const String creatorPayments = '/creator/payments';
  static const String creatorMessages = '/creator/messages';

  // Brand endpoints
  static const String brandProfile = '/brand/profile';
  static const String brandCampaigns = '/brand/campaigns';
  static const String brandPayments = '/brand/payments';
  static const String brandChat = '/brand/chat';
}

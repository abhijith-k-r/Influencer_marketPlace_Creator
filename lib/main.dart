import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/presentation/views/auth_bottom_sheet.dart';
import 'features/chat/bloc/chat_bloc.dart';
import 'features/chat/data/repositories/chat_repository.dart';
import 'features/chat/presentation/views/individual_chat_screen.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/data/repositories/creator_repository.dart';
import 'features/payments/bloc/payment_bloc.dart';
import 'features/payments/presentation/views/brand_payment_dashboard_screen.dart';
import 'features/payments/presentation/views/brand_payment_details_screen.dart';
import 'features/payments/presentation/views/brand_payment_filter_screen.dart';
import 'features/profile/bloc/profile_bloc.dart';
import 'features/profile/data/repositories/profile_repository.dart';
import 'features/role_selection/bloc/role_bloc.dart';
import 'features/role_selection/bloc/role_state.dart';
import 'features/role_selection/presentation/views/role_selection_screen.dart';
import 'features/shell/presentation/views/brand_main_shell.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CollabConnectApp());
}

/// Root widget of CollabConnect application.
/// Provides BLoC instances and dynamically switches theme tokens based on selected role.
class CollabConnectApp extends StatelessWidget {
  const CollabConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoleBloc>(
          create: (_) => RoleBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            creatorRepository: MockCreatorRepository(),
          ),
        ),
        BlocProvider<ChatBloc>(
          create: (_) => ChatBloc(
            chatRepository: MockChatRepository(),
          ),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(
            profileRepository: MockProfileRepository(),
          ),
        ),
        BlocProvider<PaymentBloc>(
          create: (_) => PaymentBloc(),
        ),
      ],
      child: BlocBuilder<RoleBloc, RoleState>(
        builder: (context, roleState) {
          return MaterialApp(
            title: 'CollabConnect',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(roleState.selectedRole),
            initialRoute: AppRoutes.splash,
            routes: {
              AppRoutes.splash: (_) => const SplashScreen(),
              AppRoutes.roleSelection: (_) => const RoleSelectionScreen(),
              AppRoutes.brandShell: (_) => const BrandMainShell(),
              AppRoutes.chatDetail: (_) => const IndividualChatScreen(),
              AppRoutes.auth: (_) => const AuthBottomSheet(),
              AppRoutes.paymentDashboard: (_) =>
                  const BrandPaymentDashboardScreen(),
              AppRoutes.paymentDetails: (_) =>
                  const BrandPaymentDetailsScreen(),
              AppRoutes.paymentFilter: (_) =>
                  const BrandPaymentFilterScreen(),
            },
          );
        },
      ),
    );
  }
}

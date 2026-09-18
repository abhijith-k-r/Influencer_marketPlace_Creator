import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_route_map.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/brand/campaigns/bloc/campaign_bloc.dart';
import 'features/brand/chat/bloc/chat_bloc.dart';
import 'features/brand/chat/data/repositories/chat_repository.dart';
import 'features/brand/home/bloc/home_bloc.dart';
import 'features/brand/home/data/repositories/creator_repository.dart';
import 'features/brand/payments/bloc/payment_bloc.dart';
import 'features/brand/profile/bloc/profile_bloc.dart';
import 'features/brand/profile/data/repositories/profile_repository.dart';
import 'features/role_selection/bloc/role_bloc.dart';
import 'features/role_selection/bloc/role_state.dart';

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
        BlocProvider<CampaignBloc>(
          create: (_) => CampaignBloc(),
        ),
      ],
      child: BlocBuilder<RoleBloc, RoleState>(
        builder: (context, roleState) {
          return MaterialApp(
            title: 'CollabConnect',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(roleState.selectedRole),
            initialRoute: AppRoutes.splash,
            routes: appRouteMap,
          );
        },
      ),
    );
  }
}

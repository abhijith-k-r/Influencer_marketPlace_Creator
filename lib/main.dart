import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_route_map.dart';
import 'core/constants/app_routes.dart';
import 'core/di/app_bloc_providers.dart';
import 'core/theme/app_theme.dart';
import 'features/role_selection/bloc/role_bloc.dart';
import 'features/role_selection/bloc/role_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CollabConnectApp());
}

/// Root widget of CollabConnect application.
/// Provides all BLoC instances and dynamically switches theme tokens based on selected role.
class CollabConnectApp extends StatelessWidget {
  const CollabConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getAppBlocProviders(),
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

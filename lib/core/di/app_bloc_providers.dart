import 'package:flutter_bloc/flutter_bloc.dart';
import '../navigation/nav_cubit.dart';
import '../../features/auth/bloc/auth_bloc.dart';
import '../../features/role_selection/bloc/role_bloc.dart';
import '../../features/brand/campaigns/bloc/campaign_bloc.dart';
import '../../features/brand/campaigns/bloc/campaign_event.dart';
import '../../features/brand/chat/bloc/chat_bloc.dart';
import '../../features/brand/chat/data/repositories/chat_repository.dart';
import '../../features/brand/home/bloc/home_bloc.dart';
import '../../features/brand/home/data/repositories/creator_repository.dart';
import '../../features/brand/payments/bloc/payment_bloc.dart';
import '../../features/brand/payments/bloc/payment_event.dart';
import '../../features/brand/profile/bloc/profile_bloc.dart' as brand_profile;
import '../../features/brand/profile/bloc/profile_event.dart' as brand_profile_event;
import '../../features/brand/profile/data/repositories/profile_repository.dart';
import '../../features/creator/home/bloc/creator_home_bloc.dart';
import '../../features/creator/home/bloc/creator_home_event.dart';
import '../../features/creator/home/data/repositories/creator_home_repository.dart';
import '../../features/creator/messages/bloc/creator_messages_bloc.dart';
import '../../features/creator/messages/bloc/creator_messages_event.dart';
import '../../features/creator/messages/data/repositories/creator_messages_repository.dart';
import '../../features/creator/my_works/bloc/creator_my_works_bloc.dart';
import '../../features/creator/my_works/bloc/creator_my_works_event.dart';
import '../../features/creator/my_works/data/repositories/creator_my_works_repository.dart';
import '../../features/creator/payments/bloc/creator_payments_bloc.dart';
import '../../features/creator/payments/bloc/creator_payments_event.dart';
import '../../features/creator/payments/data/repositories/creator_payments_repository.dart';
import '../../features/creator/profile/bloc/profile_bloc.dart' as creator_profile;
import '../../features/creator/profile/bloc/profile_event.dart' as creator_profile_event;
import '../../features/creator/profile/data/repositories/creator_profile_repository.dart';

/// Central dependency injection registry for all application BLoCs and Cubits.
List<BlocProvider> getAppBlocProviders() {
  return [
    BlocProvider<BrandNavCubit>(create: (_) => BrandNavCubit()),
    BlocProvider<CreatorNavCubit>(create: (_) => CreatorNavCubit()),
    BlocProvider<RoleBloc>(create: (_) => RoleBloc()),
    BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
    // Brand Blocs
    BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(creatorRepository: MockCreatorRepository()),
    ),
    BlocProvider<ChatBloc>(
      create: (_) => ChatBloc(chatRepository: MockChatRepository()),
    ),
    BlocProvider<brand_profile.ProfileBloc>(
      create: (_) => brand_profile.ProfileBloc(profileRepository: MockProfileRepository())
        ..add(const brand_profile_event.LoadProfileEvent()),
    ),
    BlocProvider<PaymentBloc>(
      create: (_) => PaymentBloc()..add(const LoadPaymentsEvent()),
    ),
    BlocProvider<CampaignBloc>(
      create: (_) => CampaignBloc()..add(const LoadCampaignsEvent()),
    ),
    // Creator Blocs
    BlocProvider<CreatorHomeBloc>(
      create: (_) => CreatorHomeBloc(
        repository: MockCreatorHomeRepository(),
      )..add(const LoadCreatorHomeOpportunities()),
    ),
    BlocProvider<CreatorMessagesBloc>(
      create: (_) => CreatorMessagesBloc(
        repository: MockCreatorMessagesRepository(),
      )..add(const LoadCreatorMessages()),
    ),
    BlocProvider<CreatorMyWorksBloc>(
      create: (_) => CreatorMyWorksBloc(
        repository: MockCreatorMyWorksRepository(),
      )..add(const LoadCreatorWorksData()),
    ),
    BlocProvider<CreatorPaymentsBloc>(
      create: (_) => CreatorPaymentsBloc(
        repository: MockCreatorPaymentsRepository(),
      )..add(const LoadCreatorPaymentsData()),
    ),
    BlocProvider<creator_profile.CreatorProfileBloc>(
      create: (_) => creator_profile.CreatorProfileBloc(
        repository: CreatorProfileRepository(),
      )..add(const creator_profile_event.LoadProfileEvent()),
    ),
  ];
}

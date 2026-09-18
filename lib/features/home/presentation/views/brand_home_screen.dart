import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../auth/presentation/views/auth_bottom_sheet.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../widgets/creator_card.dart';
import '../widgets/filter_chips_bar.dart';
import '../widgets/home_search_bar.dart';

/// Brand Home Screen matching the provided HTML layout.
class BrandHomeScreen extends StatefulWidget {
  const BrandHomeScreen({super.key});

  @override
  State<BrandHomeScreen> createState() => _BrandHomeScreenState();
}

class _BrandHomeScreenState extends State<BrandHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const LoadCreatorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(context),

            // Scrollable Content
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  context.read<HomeBloc>().add(const LoadCreatorsEvent());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      HomeSearchBar(
                        onChanged: (query) {
                          context
                              .read<HomeBloc>()
                              .add(SearchQueryChangedEvent(query));
                        },
                        onFilterTap: () {},
                      ),

                      const SizedBox(height: 14),

                      // Horizontal Filter Chips
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (prev, curr) =>
                            prev.selectedFilter != curr.selectedFilter,
                        builder: (context, state) {
                          return FilterChipsBar(
                            selectedFilter: state.selectedFilter,
                            onSelected: (filter) {
                              context
                                  .read<HomeBloc>()
                                  .add(SelectFilterEvent(filter));
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // Featured Section Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Matched Creators',
                                  style: AppTextStyles.headlineSm(
                                    color: AppColors.onSurface,
                                  ).copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Showing 24 creators',
                                  style: AppTextStyles.bodySm(
                                    color: AppColors.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {},
                            borderRadius: AppRadii.roundedPill,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Filter & Sort',
                                    style: AppTextStyles.labelSm(
                                      color: AppColors.primary,
                                    ).copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(width: 2),
                                  const Icon(
                                    Icons.swap_vert_rounded,
                                    size: 16,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Creator Cards List
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.status == HomeStatus.loading &&
                              state.creators.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          }

                          if (state.creators.isEmpty) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.search_off_rounded,
                                      size: 48,
                                      color: AppColors.tertiary,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'No creators found',
                                      style: AppTextStyles.labelLg(
                                        color: AppColors.onSurface,
                                      ),
                                    ),
                                    Text(
                                      'Try a different filter or search keyword',
                                      style: AppTextStyles.bodySm(
                                        color: AppColors.tertiary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.creators.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final creator = state.creators[index];
                              return CreatorCard(
                                creator: creator,
                                onViewProfile: () {},
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: AppColors.surfaceContainer.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Drawer Menu Trigger
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                borderRadius: AppRadii.roundedPill,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.menu_rounded,
                    size: 22,
                    color: AppColors.onSurface,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // CollabConnect Logo
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  AppAssets.collabConnectLogo,
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.handshake_rounded,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COLLABCONNECT',
                    style: AppTextStyles.labelSm(
                      color: AppColors.primary,
                    ).copyWith(
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Home',
                    style: AppTextStyles.headlineSm(
                      color: AppColors.onSurface,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),

          // Actions: Notification & Profile
          Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: AppRadii.roundedPill,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    size: 20,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  AuthBottomSheet.show(context);
                },
                borderRadius: AppRadii.roundedPill,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/creator_work_filter_cubit.dart';
import '../widgets/filter/work_filter_content_list.dart';
import '../widgets/filter/work_filter_header.dart';

/// Pure StatelessWidget filter view powered by CreatorWorkFilterCubit (<65 LOC).
class CreatorWorkFilterView extends StatelessWidget {
  const CreatorWorkFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreatorWorkFilterCubit(),
      child: AppScaffold(
        backgroundColor: CreatorColors.background,
        useSafeArea: true,
        body: BlocBuilder<CreatorWorkFilterCubit, CreatorWorkFilterState>(
          builder: (context, filterState) {
            final cubit = context.read<CreatorWorkFilterCubit>();
            final searchController = TextEditingController(text: filterState.searchQuery)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: filterState.searchQuery.length),
              );

            return Column(
              children: [
                WorkFilterHeader(
                  onBack: () => Navigator.of(context).pop(),
                  onResetAll: cubit.resetAll,
                ),
                Expanded(
                  child: WorkFilterContentList(
                    searchController: searchController,
                    onClearSearch: () => cubit.updateSearch(''),
                    selectedStatuses: filterState.selectedStatuses,
                    onToggleStatus: cubit.toggleStatus,
                    activeDatePreset: filterState.activeDatePreset,
                    onSelectPreset: cubit.selectDatePreset,
                    selectedFormats: filterState.selectedFormats,
                    onToggleFormat: cubit.toggleFormat,
                    onApply: () => Navigator.of(context).pop(),
                    onReset: cubit.resetAll,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

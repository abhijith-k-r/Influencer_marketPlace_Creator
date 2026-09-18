import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../widgets/filter/work_filter_content_list.dart';
import '../widgets/filter/work_filter_header.dart';

/// Screen allowing filtering of works by brand, status, dates, payout, and formats.
class CreatorWorkFilterView extends StatefulWidget {
  const CreatorWorkFilterView({super.key});

  @override
  State<CreatorWorkFilterView> createState() => _CreatorWorkFilterViewState();
}

class _CreatorWorkFilterViewState extends State<CreatorWorkFilterView> {
  late final TextEditingController _searchController;
  final Set<String> _selectedStatuses = {'Accepted', 'In Progress'};
  String _activeDatePreset = 'This Month';
  final Set<String> _selectedFormats = {'Instagram Reels', 'Stories (3x)'};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: 'UrbanKicks');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _resetAll() {
    setState(() {
      _searchController.clear();
      _selectedStatuses.clear();
      _activeDatePreset = 'All Time';
      _selectedFormats.clear();
    });
  }

  void _toggleStatus(String status) {
    setState(() {
      if (_selectedStatuses.contains(status)) {
        _selectedStatuses.remove(status);
      } else {
        _selectedStatuses.add(status);
      }
    });
  }

  void _toggleFormat(String format) {
    setState(() {
      if (_selectedFormats.contains(format)) {
        _selectedFormats.remove(format);
      } else {
        _selectedFormats.add(format);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      body: SafeArea(
        child: Column(
          children: [
            WorkFilterHeader(
              onBack: () => Navigator.of(context).pop(),
              onResetAll: _resetAll,
            ),
            Expanded(
              child: WorkFilterContentList(
                searchController: _searchController,
                onClearSearch: () => setState(() => _searchController.clear()),
                selectedStatuses: _selectedStatuses,
                onToggleStatus: _toggleStatus,
                activeDatePreset: _activeDatePreset,
                onSelectPreset: (p) => setState(() => _activeDatePreset = p),
                selectedFormats: _selectedFormats,
                onToggleFormat: _toggleFormat,
                onApply: () => Navigator.of(context).pop(),
                onReset: _resetAll,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

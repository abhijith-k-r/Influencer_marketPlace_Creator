import 'package:flutter/material.dart';
import 'package:creator_side/core/widgets/shared/app_status_pill.dart';

/// Status pill badge delegating to the global AppStatusPill component.
class MyWorksStatusBadge extends StatelessWidget {
  final String status;

  const MyWorksStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return AppStatusPill(label: status);
  }
}

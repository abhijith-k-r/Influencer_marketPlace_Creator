import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/core/widgets/shared/app_snack_bar.dart';
import 'package:creator_side/core/widgets/shared/app_progress_indicator.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_dialog.dart';

void main() {
  group('Global Reusable UI System Tests', () {
    testWidgets('AppProgressIndicator renders with custom and inline settings', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppProgressIndicator(size: 24, strokeWidth: 3, color: Colors.blue),
                AppProgressIndicator.inline(size: 16),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
      expect(find.byType(AppProgressIndicator), findsNWidgets(2));
    });

    testWidgets('AppLoadingCenter renders AppProgressIndicator centered', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppLoadingCenter(size: 40),
          ),
        ),
      );

      expect(find.byType(AppLoadingCenter), findsOneWidget);
      expect(find.byType(AppProgressIndicator), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('AppSnackBar renders floating styled snackbar with icon and message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => AppSnackBar.showSuccess(context, 'Operation Succeeded'),
                child: const Text('Show Success'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pump(); // Start animation
      await tester.pump(const Duration(milliseconds: 300)); // Animate in

      expect(find.text('Operation Succeeded'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('AppDialog.confirm displays title, message, and buttons', (tester) async {
      bool? confirmed;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  confirmed = await AppDialog.confirm(
                    context,
                    title: 'Delete Account',
                    message: 'Are you sure you want to proceed?',
                    confirmLabel: 'Delete',
                    isDestructive: true,
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Account'), findsOneWidget);
      expect(find.text('Are you sure you want to proceed?'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(confirmed, isTrue);
    });
  });
}

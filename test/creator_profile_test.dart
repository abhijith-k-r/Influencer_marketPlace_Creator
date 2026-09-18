import 'package:creator_side/features/creator/navigation/views/creator_navigation_view.dart';
import 'package:creator_side/features/creator/profile/views/creator_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CreatorProfileView renders profile details, stats, bio, and settings', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreatorProfileView()));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Aarav Sharma'), findsOneWidget);
    expect(find.text('148K'), findsOneWidget);
    expect(find.text('Reach'), findsOneWidget);
    expect(find.text('About & Creator Bio'), findsOneWidget);
    expect(find.text('PRO CREATOR'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.text('Featured Works'), findsOneWidget);
    expect(find.text('UrbanKicks Gen-2'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -1200));
    await tester.pumpAndSettle();

    expect(find.text('Account & Preferences'), findsOneWidget);
    expect(find.text('Log Out'), findsOneWidget);
  });

  testWidgets('CreatorNavigationView opens profile tab at index 4', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CreatorNavigationView(initialTab: 4),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(CreatorProfileView), findsOneWidget);
    expect(find.text('Aarav Sharma'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/features/creator/home/views/creator_home_view.dart';
import 'package:creator_side/features/creator/auth/widgets/creator_auth_bottom_sheet.dart';
import 'package:creator_side/features/creator/navigation/widgets/creator_side_drawer.dart';

void main() {
  Widget buildTestWidget() {
    return const MaterialApp(
      home: CreatorHomeView(),
    );
  }

  testWidgets('CreatorHomeView renders drawer button, CollabConnect logo, and profile avatar', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
    expect(find.text('COLLABCONNECT'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.byIcon(Icons.person_rounded), findsOneWidget);
  });

  testWidgets('Tapping drawer button opens CreatorSideDrawer with auth actions', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    // Tap menu icon to open drawer
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(CreatorSideDrawer), findsOneWidget);
    expect(find.text('CREATOR HUB'), findsOneWidget);
    expect(find.text('Sign Up Free'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Switch to Brand Portal'), findsOneWidget);
  });

  testWidgets('Tapping Sign Up Free in drawer opens CreatorAuthBottomSheet with 4 options', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    // Open drawer
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    // Tap Sign Up Free
    await tester.tap(find.text('Sign Up Free'));
    await tester.pumpAndSettle();

    expect(find.byType(CreatorAuthBottomSheet), findsOneWidget);
    expect(find.text('FAST-TRACK PASS'), findsOneWidget);
    expect(find.text('Log in or Sign up'), findsOneWidget);
    expect(find.text('Continue with Phone'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('Continue with Apple'), findsOneWidget);
    expect(find.text('Continue with Email'), findsOneWidget);
    expect(find.text('INSTITUTIONAL TRUST'), findsOneWidget);
    expect(find.text('Escrow-backed contracts'), findsOneWidget);
  });

  testWidgets('Tapping profile avatar in app bar opens CreatorAuthBottomSheet', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.person_rounded).first);
    await tester.pumpAndSettle();

    expect(find.byType(CreatorAuthBottomSheet), findsOneWidget);
    expect(find.text('FAST-TRACK PASS'), findsOneWidget);
  });
}

import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/features/creator/my_works/views/creator_work_details_view.dart';
import 'package:creator_side/features/creator/my_works/views/creator_work_filter_view.dart';
import 'package:creator_side/features/creator/my_works/views/my_works_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWorksView renders header, bento, and campaign cards', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyWorksView()));
    await tester.pumpAndSettle();

    expect(find.text('My Works'), findsOneWidget);
    expect(find.text('ACTIVE DELIVERABLES'), findsOneWidget);
    expect(find.text('₹1,27,000'), findsOneWidget);
    expect(find.text('UrbanKicks Studio'), findsOneWidget);
    expect(find.text('FitFuel Nutrition'), findsOneWidget);
  });

  testWidgets('CreatorWorkDetailsView renders hero card, escrow, and checklist', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CreatorWorkDetailsView()));
    await tester.pumpAndSettle();

    expect(find.text('Work Details'), findsOneWidget);
    expect(find.text('Sneaker Gen-2 Launch Drop'), findsOneWidget);
    expect(find.text('₹40,000 Escrow Locked'), findsOneWidget);
    expect(find.text('Campaign Deliverables'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -1400));
    await tester.pumpAndSettle();
    expect(find.text('Contact Brand'), findsOneWidget);
  });

  testWidgets('CreatorWorkFilterView renders header, search, and action buttons', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {AppRoutes.creatorWorkFilter: (_) => const CreatorWorkFilterView()},
        home: const CreatorWorkFilterView(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Filter Works'), findsOneWidget);
    expect(find.text('4 Matching Works Found'), findsOneWidget);
    expect(find.text('Deliverable Status'), findsOneWidget);

    await tester.drag(find.byType(ListView).first, const Offset(0, -800));
    await tester.pumpAndSettle();
    expect(find.text('Apply Filters (4 Results)'), findsOneWidget);
  });
}

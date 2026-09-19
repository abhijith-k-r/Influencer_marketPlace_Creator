import 'package:creator_side/core/widgets/brand/brand_side_drawer.dart';
import 'package:creator_side/core/widgets/creator/creator_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BrandSideDrawer layout does not overflow at width 256 with 1.15x text scale', (tester) async {
    tester.view.physicalSize = const Size(720, 1280);
    tester.view.devicePixelRatio = 2.8;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            textScaler: TextScaler.linear(1.15),
            size: Size(360, 640),
          ),
          child: const Scaffold(
            body: SizedBox(
              width: 256.0,
              height: 640.0,
              child: BrandSideDrawer(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Community Support'), findsOneWidget);
    expect(find.text('24/7'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('CreatorSideDrawer layout does not overflow at width 256 with 1.15x text scale', (tester) async {
    tester.view.physicalSize = const Size(720, 1280);
    tester.view.devicePixelRatio = 2.8;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            textScaler: TextScaler.linear(1.15),
            size: Size(360, 640),
          ),
          child: const Scaffold(
            body: SizedBox(
              width: 256.0,
              height: 640.0,
              child: CreatorSideDrawer(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Community Support'), findsOneWidget);
    expect(find.text('24/7'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

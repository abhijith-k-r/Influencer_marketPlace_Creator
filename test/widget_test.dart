import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/main.dart';
import 'package:creator_side/features/splash/presentation/views/splash_screen.dart';

void main() {
  testWidgets('CollabConnectApp renders SplashScreen on launch', (tester) async {
    await tester.pumpWidget(const CollabConnectApp());
    await tester.pump();
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}

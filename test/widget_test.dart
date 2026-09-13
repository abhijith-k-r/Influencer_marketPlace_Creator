import 'package:flutter_test/flutter_test.dart';
import 'package:creator_side/main.dart';
import 'package:creator_side/core/constants/app_strings.dart';

void main() {
  testWidgets('SignupScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CreatorApp());
    await tester.pump();

    // Verify key titles are present on screen
    expect(find.text(AppStrings.signupTitle), findsOneWidget);
    expect(find.text(AppStrings.creatorPlatform), findsOneWidget);
    expect(find.text(AppStrings.createAccount), findsOneWidget);
  });
}

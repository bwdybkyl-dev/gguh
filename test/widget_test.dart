import 'package:flutter_test/flutter_test.dart';
import 'package:smart_educational_advisor/app/app.dart';

void main() {
  testWidgets('renders the authentication entry screen', (tester) async {
    await tester.pumpWidget(const SmartEducationalAdvisorApp());
    expect(find.text('أهلاً بعودتك'), findsOneWidget);
  });
}

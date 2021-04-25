import 'package:cats_and_dogs/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows an app', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}

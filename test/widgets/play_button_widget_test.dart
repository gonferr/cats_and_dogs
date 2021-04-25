import 'package:cats_and_dogs/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows a PlayButton', (WidgetTester tester) async {
    await pumpApp(tester, makePlayButton());
    expect(find.byType(PlayButtonWidget), findsOneWidget);
  });

  testWidgets('shows a red playButton', (WidgetTester tester) async {
    final myButton = makePlayButton(playButton: PlayButton(color: Colors.red));
    await pumpApp(tester, myButton);

    expect(myButton.playButton.color(), Colors.red);
  });

  [
    {'firstColor': Colors.red, 'secondColor': Colors.grey},
    {'firstColor': Colors.green, 'secondColor': Colors.red},
    {'firstColor': Colors.grey, 'secondColor': Colors.green}
  ].forEach((element) {
    testWidgets(
        'when ${element['firstColor']} and on tap changes to ${element['secondColor']} color',
        (WidgetTester tester) async {
      await pumpApp(tester,
          makePlayButton(playButton: PlayButton(color: element['firstColor'])));

      await tapByType<PlayButtonWidget>(tester);

      final bt = find.byType(Card).first.evaluate();
      expect((bt.first.widget as Card).color, element['secondColor']);
    });
  });
}

Future tapByType<T>(WidgetTester tester) async {
  await tester.tap(find.byType(T));
  await tester.pumpAndSettle();
}

Future<void> pumpApp(WidgetTester tester, Widget widget) async {
  return await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
}

PlayButtonWidget makePlayButton({PlayButton playButton}) {
  playButton = playButton ?? PlayButton();
  return PlayButtonWidget(playButton: playButton);
}

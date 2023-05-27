import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing_with_animation/home_screen.dart';

void main() {
  //GIVEN, WHEN, THEN//
  testWidgets('''GIVEN HomeScreen the Container is green WHEN it is tapped 
      THEN the Container should be red and scalled with animation,also the action should be repeated by every tap on the container....''',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));
    expect(find.byType(AppBar), findsOneWidget);
    var container =
        tester.widget<AnimatedContainer>(find.byKey(const Key('aniCont')));

    //Initial values//
    expect(container.constraints!.minWidth, 100);
    expect(container.constraints!.minHeight, 100);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(0));
    //=== end ===//

    await tester.tap(find.byKey(const Key('myBtn')));
    await tester.pumpAndSettle();

    //After first Tap the button, new values//
    container =
        tester.widget<AnimatedContainer>(find.byKey(const Key('aniCont')));
    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.red);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(50));
    //=== end ===//

    await tester.tap(find.byKey(const Key('myBtn')));
    await tester.pumpAndSettle();

    //After second Tap the button, new values//
    container =
        tester.widget<AnimatedContainer>(find.byKey(const Key('aniCont')));
    expect(container.constraints!.minWidth, 100);
    expect(container.constraints!.minHeight, 100);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(0));
    //=== end ===//
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/widgets/animation_view.dart';

import '../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Animation widget test', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(
        child: const AnimationView(
      child: Text('Hello'),
    )));
    await widgetTester.pump();

    expect(find.byType(SlideTransition), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('Animation widget with addition params', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(
        child: const AnimationView(
            delay: Duration(microseconds: AppValues.animationMicroDelay800),
            fadeIn: false,
            slidingCurve: Curves.bounceIn,
            fadingDuration:
                Duration(microseconds: AppValues.animationMicroDelay800),
            child: Text('Hello'))));
    await widgetTester.pump();

    expect(find.byType(SlideTransition), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);
  });
}

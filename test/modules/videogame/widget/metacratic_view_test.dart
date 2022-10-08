import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/metacratic_view.dart';

import '../../../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Metacratic view has a null data', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(child: const MetacraticView()));
    await widgetTester.pump();

    /// Game Metacritic Score
    expect(find.text('0'), findsOneWidget);
    final containerFinder = find.byType(Container);
    final containerWidget =
        widgetTester.firstWidget<Container>(containerFinder);

    expect(
      (containerWidget.decoration as BoxDecoration).color,
      Colors.red,
    );
  });

  testWidgets('Metacratic view has a data', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(
        child: const MetacraticView(
      metacriticScoreColor: Colors.lightGreenAccent,
      metacriticScore: 75,
      borderRadius:
          BorderRadius.only(topRight: Radius.circular(AppValues.radiusDefault)),
      alignment: Alignment.centerLeft,
    )));
    await widgetTester.pump();

    /// Game Metacritic Score
    expect(find.text('75'), findsOneWidget);
    final containerFinder = find.byType(Container);
    final containerWidget =
        widgetTester.firstWidget<Container>(containerFinder);

    expect(
      (containerWidget.decoration as BoxDecoration).color,
      Colors.lightGreenAccent,
    );
  });
}

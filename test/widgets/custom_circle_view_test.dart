import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/widgets/custom_circle_icon_view.dart';

import '../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Custom circle icon test', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(
        child: const CustomCircleIconView(child: Icon(Icons.arrow_back))));
    await widgetTester.pump();

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('Custom circle icon with onTap event', (widgetTester) async {
    bool isIconClick = false;
    await widgetTester.pumpWidget(createTestApp(
        child: CustomCircleIconView(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              isIconClick = true;
            })));
    await widgetTester.pump();

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    /// Before CTA click
    expect(isIconClick, false);

    /// After CTA click
    await widgetTester.tap(find.byIcon(Icons.arrow_back));
    await widgetTester.pump();
    expect(isIconClick, true);
  });
}

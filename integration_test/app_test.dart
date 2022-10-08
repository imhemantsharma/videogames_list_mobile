import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:videogames_list_mobile/app/core/widgets/custom_circle_icon_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_card_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_platforms_view.dart';
import 'package:videogames_list_mobile/app/my_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> scrollListItem(WidgetTester widgetTester, int n) async {
    for (int i = 0; i < n; i++) {
      await widgetTester.dragUntilVisible(
        find.byType(GameCardView).last,
        find.byType(ListView),
        const Offset(0, 300),
      );
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 100));
    }
  }

  testWidgets('end-to-end test', (widgetTester) async {
    final SemanticsHandle handle = widgetTester.ensureSemantics();

    await widgetTester.pumpWidget(const MyApp());
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.byType(GameCardView), findsWidgets);

    /// Pull down refresh
    await widgetTester.fling(
        find.byType(GameCardView).first, const Offset(0.0, 300.0), 1000.0);
    await widgetTester.pump();

    expect(
        widgetTester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ));

    await widgetTester.pumpAndSettle(
        const Duration(seconds: 1)); // finish the scroll animation
    await widgetTester.pumpAndSettle(const Duration(
        milliseconds: 500)); // finish the indicator settle animation
    await widgetTester.pumpAndSettle(const Duration(
        milliseconds: 500)); // finish the indicator hide animation

    /// Navigate to detail page
    await widgetTester.tap(find.byType(GameCardView).first);
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

    sleep(const Duration(seconds: 1));

    /// Scroll down on detail page
    var gesture = await widgetTester
        .startGesture(const Offset(200, 400)); //Position of the scrollview
    await gesture.moveBy(const Offset(200, -400)); //How much to scroll by
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(GamePlatformsView), findsOneWidget);

    /// Scroll Up on detail page
    gesture = await widgetTester
        .startGesture(const Offset(200, 500)); //Position of the scrollview
    await gesture.moveBy(const Offset(-200, 500)); //How much to scroll by
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    sleep(const Duration(seconds: 1));

    /// Navigate back to main screen
    await widgetTester.tap(find.byType(CustomCircleIconView));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
    await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

    sleep(const Duration(seconds: 3));

    /// List scroll to bottom at some extent
    await scrollListItem(widgetTester, 20);
    await widgetTester.pumpAndSettle();

    sleep(const Duration(seconds: 2));

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

    handle.dispose();
  });
}

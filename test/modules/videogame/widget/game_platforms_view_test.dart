import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_platforms_view.dart';

import '../../../mock_create_test_app.dart';
import '../../../mock_games_data_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    ///  To avoid TestWidgetsFlutterBinding, all HTTP requests will return status code 400
    HttpOverrides.global = null;
  });

  testWidgets('Game platform card has a empty data', (widgetTester) async {
    await widgetTester.pumpWidget(
        createTestApp(child: const GamePlatformsView(platforms: [])));
    await widgetTester.pump();

    expect(find.text('Platforms'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsNothing);
  });

  testWidgets('Game platform card has a data', (widgetTester) async {
    var platformList = gameDetailResponse.platforms ?? [];

    await widgetTester.pumpWidget(
        createTestApp(child: GamePlatformsView(platforms: platformList)));
    await widgetTester.pump();

    expect(find.text('Platforms'), findsOneWidget);
    if (platformList.isNotEmpty) {
      expect(
          find.byType(CachedNetworkImage), findsNWidgets(platformList.length));

      /// +1 denotes the [Platforms] text widget
      expect(find.byType(Text), findsNWidgets(platformList.length + 1));
    }
  });
}

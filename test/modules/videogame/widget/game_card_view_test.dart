import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_card_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/metacratic_view.dart';

import '../../../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Game card has a null data', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(child: const GameCardView()));
    await widgetTester.pump();

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.byType(RatingBarIndicator), findsOneWidget);
    expect(find.byType(MetacraticView), findsOneWidget);
  });

  testWidgets('Game card has a data', (widgetTester) async {
    var isOnCardTap = false;

    await widgetTester.pumpWidget(createTestApp(
        child: GameCardView(
      metacriticScoreColor: Colors.lightGreenAccent,
      metacriticScore: 75,
      rating: 4,
      date: "2020-10-06",
      name: "FIFA 21",
      posterUrl:
          "https://media.rawg.io/media/games/df4/df415b18835f91a1b4db1da294996ee5.jpg",
      onCardTap: () {
        isOnCardTap = true;
      },
    )));
    await widgetTester.pump();

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.byType(RatingBarIndicator), findsOneWidget);
    expect(find.byType(MetacraticView), findsOneWidget);

    /// Game name
    expect(find.text('FIFA 21'), findsOneWidget);

    /// Game Metacritic Score
    expect(find.text('75'), findsOneWidget);

    /// Before card tap
    expect(isOnCardTap, false);

    await widgetTester.tap(find.byType(GameCardView));
    await widgetTester.pump();

    /// After card tap
    expect(isOnCardTap, true);
  });
}

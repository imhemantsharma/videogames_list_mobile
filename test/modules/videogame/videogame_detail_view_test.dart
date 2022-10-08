import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:videogames_list_mobile/app/core/widgets/animation_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/custom_circle_icon_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/draggable_sheet_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/error_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/loading_view.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/modules/videogame/bindings/videogame_detail_binding.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_detail_controller.dart';
import 'package:videogames_list_mobile/app/modules/videogame/views/videogame_detail_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_platforms_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/metacratic_view.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

import '../../mock_create_test_app.dart';
import '../../mock_games_data_repository.dart';
import '../../mock_network_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BindingsBuilder bindingsBuilder;
  late VideoGameDetailController controller;

  setUpAll(() async {
    ///  To avoid TestWidgetsFlutterBinding, all HTTP requests will return status code 400
    HttpOverrides.global = null;

    bindingsBuilder = BindingsBuilder<dynamic>(() {
      Get.lazyPut<INetworkInfoProvider>(() => MockNetworkController());

      Get.lazyPut<IGamesDataRepository>(() => MockGamesDataRepository());
      Get.lazyPut(() => VideoGameDetailController());
    });

    bindingsBuilder.builder();
    controller = Get.find<VideoGameDetailController>();
  });

  testWidgets('Video game detail state (loading, error, and empty) test',
      (widgetTester) async {
    late BuildContext context;
    await widgetTester.pumpWidget(createTestApp(
        initialBindig: VideoGameDetailBinding(),
        child: const VideoGameDetailView(),
        builder: (buildContext) {
          context = buildContext;
        }));

    /// Loading
    controller.change(null, status: RxStatus.loading());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsOneWidget);
    expect(find.byType(ErrorView), findsNothing);
    expect(find.text(S.of(context).noDataFound), findsNothing);

    expect(find.byType(CachedNetworkImage), findsNothing);
    expect(find.byType(AnimationView), findsNothing);
    expect(find.byType(CustomCircleIconView), findsNothing);
    expect(find.byType(DraggableSheetView), findsNothing);
    expect(find.byType(RatingBarIndicator), findsNothing);
    expect(find.byType(MetacraticView), findsNothing);
    expect(find.byType(ReadMoreText), findsNothing);
    expect(find.byType(GamePlatformsView), findsNothing);

    /// Empty
    controller.change(null, status: RxStatus.empty());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsNothing);
    expect(find.byType(ErrorView), findsNothing);
    expect(find.text(S.of(context).noDataFound), findsOneWidget);

    expect(find.byType(CachedNetworkImage), findsNothing);
    expect(find.byType(AnimationView), findsNothing);
    expect(find.byType(CustomCircleIconView), findsNothing);
    expect(find.byType(DraggableSheetView), findsNothing);
    expect(find.byType(RatingBarIndicator), findsNothing);
    expect(find.byType(MetacraticView), findsNothing);
    expect(find.byType(ReadMoreText), findsNothing);
    expect(find.byType(GamePlatformsView), findsNothing);

    /// Error
    controller.change(null, status: RxStatus.error());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsNothing);
    expect(find.byType(ErrorView), findsOneWidget);
    expect(find.text(S.of(context).noDataFound), findsNothing);

    expect(find.byType(CachedNetworkImage), findsNothing);
    expect(find.byType(AnimationView), findsNothing);
    expect(find.byType(CustomCircleIconView), findsNothing);
    expect(find.byType(DraggableSheetView), findsNothing);
    expect(find.byType(RatingBarIndicator), findsNothing);
    expect(find.byType(MetacraticView), findsNothing);
    expect(find.byType(ReadMoreText), findsNothing);
    expect(find.byType(GamePlatformsView), findsNothing);
  });

  testWidgets('Success state test', (widgetTester) async {
    Get.parameters = <String, String>{"gameId": "437049"};
    controller.onInit();
    late BuildContext context;
    await widgetTester.pumpWidget(createTestApp(
        initialBindig: VideoGameDetailBinding(),
        child: const VideoGameDetailView(),
        builder: (buildContext) {
          context = buildContext;
        }));
    await widgetTester.pumpAndSettle();

    expect(find.byType(LoadingView), findsNothing);
    expect(find.byType(ErrorView), findsNothing);
    expect(find.text(S.of(context).noDataFound), findsNothing);

    expect(find.byType(CachedNetworkImage), findsWidgets);
    expect(find.byType(AnimationView), findsWidgets);
    expect(find.byType(CustomCircleIconView), findsOneWidget);
    expect(find.byType(DraggableSheetView), findsOneWidget);
    expect(find.byType(RatingBarIndicator), findsOneWidget);
    expect(find.byType(MetacraticView), findsOneWidget);
    expect(find.byType(ReadMoreText), findsOneWidget);

    var gesture = await widgetTester
        .startGesture(const Offset(0, 400)); //Position of the scrollview
    await gesture.moveBy(const Offset(0, -400)); //How much to scroll by
    await widgetTester.pumpAndSettle();

    expect(find.byType(GamePlatformsView), findsOneWidget);
  });

  testWidgets('Back cta test', (widgetTester) async {
    Get.parameters = <String, String>{"gameId": "437049"};
    controller.onInit();
    await widgetTester.pumpWidget(createTestApp(
      initialBindig: VideoGameDetailBinding(),
      child: const VideoGameDetailView(),
    ));
    await widgetTester.pumpAndSettle();

    expect(find.byType(CustomCircleIconView), findsOneWidget);

    /// Back cta click
    await widgetTester.tap(find.byType(CustomCircleIconView));
    await widgetTester.pumpAndSettle();
  });
}

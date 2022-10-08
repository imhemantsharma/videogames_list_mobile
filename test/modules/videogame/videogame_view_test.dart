import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/widgets/error_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/loading_view.dart';
import 'package:videogames_list_mobile/app/core/widgets/pagination_error_view.dart';
import 'package:videogames_list_mobile/app/data/repository/games_data_repository.dart';
import 'package:videogames_list_mobile/app/modules/videogame/bindings/videogame_binding.dart';
import 'package:videogames_list_mobile/app/modules/videogame/controllers/videogame_controller.dart';
import 'package:videogames_list_mobile/app/modules/videogame/views/videogame_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/widget/game_card_view.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

import '../../mock_create_test_app.dart';
import '../../mock_games_data_repository.dart';
import '../../mock_network_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BindingsBuilder bindingsBuilder;
  late VideoGameController controller;
  late INetworkInfoProvider networkInfoProvider;

  setUpAll(() async {
    ///  To avoid TestWidgetsFlutterBinding, all HTTP requests will return status code 400
    HttpOverrides.global = null;

    bindingsBuilder = BindingsBuilder<dynamic>(() {
      Get.lazyPut<INetworkInfoProvider>(() => MockNetworkController());

      Get.lazyPut<IGamesDataRepository>(() => MockGamesDataRepository());
      Get.lazyPut(() => VideoGameController());
    });

    bindingsBuilder.builder();
    controller = Get.find<VideoGameController>();
    networkInfoProvider = Get.find<INetworkInfoProvider>();
  });

  testWidgets('Video game state (loading, error, and empty) test',
      (widgetTester) async {
    late BuildContext context;
    await widgetTester.pumpWidget(createTestApp(
        initialBindig: VideoGameBinding(),
        child: const VideoGameView(),
        builder: (buildContext) {
          context = buildContext;
        }));

    /// Loading
    controller.change(null, status: RxStatus.loading());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsOneWidget);
    expect(find.byType(ErrorView), findsNothing);
    expect(find.text(S.of(context).noDataFound), findsNothing);

    /// Empty
    controller.change(null, status: RxStatus.empty());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsNothing);
    expect(find.byType(ErrorView), findsNothing);
    expect(find.text(S.of(context).noDataFound), findsOneWidget);

    /// Error
    controller.change(null, status: RxStatus.error());
    await widgetTester.pump();
    expect(find.byType(LoadingView), findsNothing);
    expect(find.byType(ErrorView), findsOneWidget);
    expect(find.text(S.of(context).noDataFound), findsNothing);
  });

  group('Video game success state', () {
    testWidgets('Success state test', (widgetTester) async {
      controller.onInit();
      await widgetTester.pumpWidget(createTestApp(
          initialBindig: VideoGameBinding(), child: const VideoGameView()));
      await widgetTester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(GameCardView), findsWidgets);

      await widgetTester.tap(find.byType(GameCardView).first);
      await widgetTester.pumpAndSettle();

      expect(find.text(textUnknownRoute), findsOneWidget);
    });

    testWidgets('Pull to refresh state test', (widgetTester) async {
      controller.onInit();
      final SemanticsHandle handle = widgetTester.ensureSemantics();

      await widgetTester.pumpWidget(createTestApp(
          initialBindig: VideoGameBinding(), child: const VideoGameView()));
      await widgetTester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(GameCardView), findsWidgets);

      /// Pull down refresh test
      await widgetTester.fling(
          find.byType(GameCardView).first, const Offset(0.0, 300.0), 1000.0);
      await widgetTester.pump();

      expect(
          widgetTester.getSemantics(find.byType(RefreshProgressIndicator)),
          matchesSemantics(
            label: 'Refresh',
          ));

      await widgetTester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await widgetTester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await widgetTester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(GameCardView), findsWidgets);

      handle.dispose();
    });

    testWidgets('Pagination loading state test', (widgetTester) async {
      controller.onInit();
      final SemanticsHandle handle = widgetTester.ensureSemantics();

      await widgetTester.pumpWidget(createTestApp(
          initialBindig: VideoGameBinding(), child: const VideoGameView()));
      await widgetTester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(GameCardView), findsWidgets);

      /// Pagination bottom loading test
      await widgetTester.dragUntilVisible(
          find.byType(GameCardView).last, // what you want to find
          find.byType(ListView),
          // widget you want to scroll
          const Offset(0, 500) // delta to move
          );
      await widgetTester.pumpAndSettle();

      if (controller.isPaginationLoading.value) {
        expect(find.byType(LoadingView), findsOneWidget);
      }
      handle.dispose();
    });

    testWidgets('Pagination error state test', (widgetTester) async {
      final SemanticsHandle handle = widgetTester.ensureSemantics();

      controller.onInit();

      await widgetTester.pumpWidget(createTestApp(
          initialBindig: VideoGameBinding(), child: const VideoGameView()));
      await widgetTester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(GameCardView), findsWidgets);

      /// Pagination error when network not connected
      networkInfoProvider.isNetworkConnected.value = false;
      await widgetTester.dragUntilVisible(
          find.byType(GameCardView).last, // what you want to find
          find.byType(ListView),
          // widget you want to scroll
          const Offset(0, 500) // delta to move
          );
      await widgetTester.pumpAndSettle();

      if (controller.isPaginationError.value) {
        expect(find.byType(PaginationErrorView), findsWidgets);
      }
      handle.dispose();
    });
  });
}

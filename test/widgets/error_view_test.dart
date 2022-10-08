import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/widgets/error_view.dart';
import 'package:videogames_list_mobile/app/network/network_controller.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

import '../mock_create_test_app.dart';
import '../mock_network_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  group('Network connected', () {
    setUpAll(
        () => Get.lazyPut<INetworkInfoProvider>(() => MockNetworkController()));

    testWidgets('Error view has a null data', (widgetTester) async {
      late BuildContext context;
      await widgetTester.pumpWidget(createTestApp(
          child: ErrorView(),
          builder: (buildContext) {
            context = buildContext;
          }));
      await widgetTester.pump();

      expect(find.text(S.of(context).errorTitle), findsOneWidget);

      expect(find.text(S.of(context).retry), findsNothing);
      expect(find.byIcon(Icons.refresh), findsNothing);
    });

    testWidgets('Error view has a data', (widgetTester) async {
      late bool onErrorCTAClick = false;
      await widgetTester.pumpWidget(createTestApp(
          child: ErrorView(
        messageTitle: "Title",
        messageDesc: "Description",
        errorCTA: "Error CTA",
        onErrorCTAClicked: () {
          onErrorCTAClick = true;
        },
      )));
      await widgetTester.pump();

      expect(find.text("Title"), findsOneWidget);
      expect(find.text("Description"), findsOneWidget);
      expect(find.text("Error CTA"), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);

      /// Before CTA click
      expect(onErrorCTAClick, false);

      /// After CTA click
      await widgetTester.tap(find.byIcon(Icons.refresh));
      await widgetTester.pump();
      expect(onErrorCTAClick, true);
    });

    tearDownAll(() => Get.deleteAll());
  });

  group('Network dis-connected', () {
    setUpAll(() =>
        Get.put<INetworkInfoProvider>(MockNetworkControllerDisconnected()));

    tearDownAll(() => Get.delete());

    testWidgets('Error view network test', (widgetTester) async {
      late BuildContext context;

      await widgetTester.pumpWidget(createTestApp(
          child: ErrorView(),
          builder: (buildContext) {
            context = buildContext;
          }));
      await widgetTester.pumpAndSettle();

      expect(find.text(S.of(context).errorTitle), findsOneWidget);
      expect(find.text(S.of(context).noNetworkMessage), findsOneWidget);
    });
  });
}

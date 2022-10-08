import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

import 'mock_navigator_observer.dart';

String textUnknownRoute = 'Unknown Route';

Widget createTestApp(
    {required Widget child,
    Bindings? initialBindig,
    Function(BuildContext)? builder}) {
  return GetMaterialApp(
    home: Builder(builder: (context) {
      if (builder != null) builder(context);
      return Material(child: child);
    }),
    initialBinding: initialBindig,
    onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute(
          settings: settings, builder: (context) => Text(textUnknownRoute));
    },
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    navigatorObservers: [MockNavigatorObserver()],
  );
}

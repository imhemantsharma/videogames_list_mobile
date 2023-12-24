import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:videogames_list_mobile/app/bindings/initial_binding.dart';
import 'package:videogames_list_mobile/app/core/utils/light_theme.dart';
import 'package:videogames_list_mobile/app/modules/videogame/views/videogame_view.dart';
import 'package:videogames_list_mobile/app/routes/app_pages.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

///
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Games List',
      theme: lightTheme,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial.routeName,
      unknownRoute: GetPage<dynamic>(
        name: AppPages.initial.routeName,
        page: () {
          return const VideoGameView();
        },
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      getPages: AppPages.routes,
    );
  }
}

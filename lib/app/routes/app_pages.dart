import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videogames_list_mobile/app/core/widgets/custom_transition.dart';
import 'package:videogames_list_mobile/app/modules/videogame/bindings/videogame_binding.dart';
import 'package:videogames_list_mobile/app/modules/videogame/bindings/videogame_detail_binding.dart';
import 'package:videogames_list_mobile/app/modules/videogame/views/videogame_detail_view.dart';
import 'package:videogames_list_mobile/app/modules/videogame/views/videogame_view.dart';

part 'app_routes.dart';

///
class AppPages {
  /// private constructor
  AppPages._();

  /// Initial launch screen path
  static const initial = Routes.launch;

  /// All available routes declaration
  static final routes = [
    GetPage<MaterialPageRoute>(
        name: Routes.launch.routeName,
        page: () => const VideoGameView(),
        binding: VideoGameBinding(),
        children: [
          GetPage<MaterialPageRoute>(
              name: Routes.gameDetail.routeName,
              page: () => const VideoGameDetailView(),
              binding: VideoGameDetailBinding(),
              transitionDuration: const Duration(microseconds: 800),
              customTransition: CustomSlideTransition()),
        ]),
  ];
}

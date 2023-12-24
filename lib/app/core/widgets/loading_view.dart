import 'package:flutter/material.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppValues.paddingDouble),
      child: const CircularProgressIndicator(),
    );
  }
}

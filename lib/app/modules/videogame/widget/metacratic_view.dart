import 'package:flutter/material.dart';
import 'package:videogames_list_mobile/app/core/values/app_values.dart';
import 'package:videogames_list_mobile/app/core/values/text_styles.dart';

class MetacraticView extends StatelessWidget {
  const MetacraticView({
    super.key,
    this.metacriticScore = 0,
    this.metacriticScoreColor,
    this.borderRadius,
    this.alignment,
  });

  final int metacriticScore;
  final Color? metacriticScoreColor;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topRight,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            borderRadius: borderRadius ??
                const BorderRadius.only(
                    topRight: Radius.circular(AppValues.radiusDefault)),
            color: metacriticScoreColor ?? Colors.red),
        alignment: Alignment.center,
        child: Text(
          metacriticScore.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: heading.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget horizontalSpacing(double space) {
  return SizedBox(
    width: space,
  );
}

Widget verticalSpacing(double space) {
  return SizedBox(
    height: space,
  );
}

class Helper {
  Helper._();

  /// Return different colors based on Metacritic score
  static Color metacriticScoreColor(int score) {
    if (score < 50) {
      return Colors.red;
    } else if (score < 75) {
      return Colors.amberAccent;
    }

    return Colors.lightGreenAccent;
  }
}

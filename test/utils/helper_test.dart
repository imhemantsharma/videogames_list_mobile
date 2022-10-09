
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/utils/helper.dart';

void main() {

  test('Metacratic color test', () {
    Color color = Helper.metacriticScoreColor(0);
    expect(color, Colors.red);

    color = Helper.metacriticScoreColor(49);
    expect(color, Colors.red);

    color = Helper.metacriticScoreColor(50);
    expect(color, Colors.amberAccent);

    color = Helper.metacriticScoreColor(74);
    expect(color, Colors.amberAccent);

    color = Helper.metacriticScoreColor(75);
    expect(color, Colors.lightGreenAccent);

    color = Helper.metacriticScoreColor(101);
    expect(color, Colors.lightGreenAccent);
  });
}
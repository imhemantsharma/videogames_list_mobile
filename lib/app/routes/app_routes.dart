part of 'app_pages.dart';

enum Routes {
  launch('/'),
  gameDetail('/gameDetail');

  final String routeName;

  const Routes(this.routeName);
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/widgets/loading_view.dart';

import '../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Loading widget test', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(child: const LoadingView()));
    await widgetTester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

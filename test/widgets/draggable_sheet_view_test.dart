import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/widgets/draggable_sheet_view.dart';

import '../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Draggable sheet view test', (widgetTester) async {
    await widgetTester.pumpWidget(createTestApp(
        child: const DraggableSheetView(
      minSize: 0.65,
      child: [
        Text('Test 1'),
        Text('Test 2'),
      ],
    )));
    await widgetTester.pump();

    expect(find.byType(DraggableScrollableSheet), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Test 1'), findsOneWidget);
    expect(find.text('Test 2'), findsOneWidget);
  });
}

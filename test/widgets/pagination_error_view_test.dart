import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videogames_list_mobile/app/core/widgets/pagination_error_view.dart';
import 'package:videogames_list_mobile/generated/l10n.dart';

import '../mock_create_test_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Pagination error view has a null data', (widgetTester) async {
    late BuildContext context;
    await widgetTester.pumpWidget(createTestApp(
        child: const PaginationErrorView(),
        builder: (buildContext) {
          context = buildContext;
        }));
    await widgetTester.pump();

    expect(find.text(S.of(context).fetchingDataError), findsOneWidget);
    expect(find.text(S.of(context).retry), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets('Pagination error view has a data', (widgetTester) async {
    late BuildContext context;
    bool isOnTap = false;
    await widgetTester.pumpWidget(createTestApp(
        child: PaginationErrorView(
          errorTitle: "Something went wrong!",
          onTap: () {
            isOnTap = true;
          },
        ),
        builder: (buildContext) {
          context = buildContext;
        }));
    await widgetTester.pump();

    expect(find.text(S.of(context).fetchingDataError), findsNothing);
    expect(find.text('Something went wrong!'), findsOneWidget);
    expect(find.text(S.of(context).retry), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);

    /// Before CTA tap
    expect(isOnTap, false);

    /// After CTA tap
    await widgetTester.tap(find.byIcon(Icons.refresh));
    await widgetTester.pump();
    expect(isOnTap, true);
  });
}

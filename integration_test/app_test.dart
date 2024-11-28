import 'package:event_planner/config/test_config/test_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_planner/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'test API',
        () {
          testWidgets(
            'test For Happy Path',
                (tester) async {
              app.main(testConfig: TestConfig.happyPathWithStatus200);
              await tester.pumpAndSettle();
              await Future.delayed(const Duration(seconds: 2));
              expect(find.text("title 1"), findsOneWidget);
            },
          );

          // testWidgets(
          //   'test for unHappy Path',
          //       (tester) async {
          //     app.main(testConfig: TestConfig.unHappyPathWithStatus500);
          //     await tester.pumpAndSettle();
          //     await Future.delayed(const Duration(seconds: 2));
          //     expect(find.text("Bad request"), findsOneWidget);
          //   },
          // );
    },
  );

}


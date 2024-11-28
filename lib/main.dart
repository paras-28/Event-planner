import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/core/utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/routes/app_router.dart';
import 'config/test_config/test_config.dart';

Future<void> main({
  TestConfig?  testConfig
}) async {

  WidgetsFlutterBinding.ensureInitialized();
  // final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      dioProvider.overrideWithValue(dioObjectRecogniser(testConfig)),
      // override the previous value with the new object
      // sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Responsive.size = MediaQuery.sizeOf(context);

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routers,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/core/utils/responsive_util.dart';
import 'package:event_planner/domain/entities/local_models/event/event_local_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/routes/app_router.dart';
import 'config/test_config/test_config.dart';

Future<void> main({
  TestConfig?  testConfig
}) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await  initialiseHive();
  runApp(ProviderScope(
    overrides: [
      dioProvider.overrideWithValue(dioObjectRecogniser(testConfig)),
    ],
    child: const MyApp(),
  ));

}


Future<void> initialiseHive() async {
  //key
  const postsKey = 'events';
  //adapters
  Hive.registerAdapter(EventLocalModelAdapter());
  //box
  final postsBox = await Hive.openBox<EventLocalModel?>(postsKey);
  //repos
  // PostsRepository(postsBox: postsBox);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.size = MediaQuery.sizeOf(context);
    return MaterialApp.router(
      title: 'Eventy',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routers,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


import 'package:event_planner/presentation/features/home/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();

}

class _HomeScreenState extends ConsumerState<HomeScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_)
    {
      ref.read(homeControllerProvider.notifier).getData();
    });

  }



  @override
  Widget build(BuildContext context) {
    HomeScreenState  dashboardScreenStateNotifier = ref.watch(homeControllerProvider);
    return Scaffold(

    );
  }

}

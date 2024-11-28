import 'package:event_planner/config/routes/app_routes_name.dart';
import 'package:event_planner/core/utils/app_strings.dart';
import 'package:event_planner/presentation/common_widgets/custom_appbar.dart';
import 'package:event_planner/presentation/common_widgets/slidable_list_tile.dart';
import 'package:event_planner/presentation/features/home/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: (){

        context.goNamed(AppRoutesName.addEventScreen);
      },
        child: const Icon(Icons.add,
        size: 22,
        ),
      
      ),
      appBar: const CustomAppbar(title: AppStrings.eventy,
        hasArrow: false,
      ),
      body: ListView.builder(
      itemCount: dashboardScreenStateNotifier.listOFEventModel?.length ?? 0,
      physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
        return SlideMenu(
          menuItems: <Widget>[
            Container(
              color: Colors.black12,
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ),
            Container(
              color: Colors.red,
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          ],
          child:  ListTile(
            title: Text(dashboardScreenStateNotifier.listOFEventModel![index].title ?? ''),
          ),
        );
      }),

    );
  }

}

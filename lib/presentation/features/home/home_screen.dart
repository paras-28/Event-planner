import 'package:event_planner/config/routes/app_routes_name.dart';
import 'package:event_planner/core/utils/app_strings.dart';
import 'package:event_planner/data/data_utility/data_utility.dart';
import 'package:event_planner/presentation/common_widgets/custom_appbar.dart';
import 'package:event_planner/presentation/common_widgets/custom_loader.dart';
import 'package:event_planner/presentation/common_widgets/error_view.dart';
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
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_)
    // {
    //   ref.read(homeControllerProvider.notifier).getData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // HomeScreenState  dashboardScreenStateNotifier = ref.watch(homeControllerProvider);
    final homePageStateNotifier = ref.watch(homepageProvider);

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
      body: Center(
        child: homePageStateNotifier.when(
            data: (final valueOrNull) =>valueOrNull == null ? const ErrorView(
              message: ExceptionStrings.noDataAvailable,
            ) :  ListView.builder(
                itemCount: homePageStateNotifier.valueOrNull?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text((index + 1).toString(),
                       ),
                    title: Text(
                      homePageStateNotifier.valueOrNull![index].title ?? '',
                    ),
                  );
                }),
            error: (e, s) =>  ErrorView(
              message: e.toString()
            ) ,
            loading: () => const CustomLoader()),
      ),
        );
  }

}
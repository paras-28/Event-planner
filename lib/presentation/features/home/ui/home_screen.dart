import 'package:event_planner/config/routes/routes.dart';
import 'package:event_planner/core/utils/utils.dart';
import 'package:event_planner/data/data_utility/data_utility.dart';
import 'package:event_planner/domain/entities/models/event/event_model.dart';
import 'package:event_planner/presentation/common_widgets/common_widgets.dart';
import 'package:event_planner/presentation/features/home/controller/home_screen_controller.dart';
import 'package:event_planner/presentation/features/set_event/controller/set_event_controller.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final homePageStateNotifier = ref.watch(homepageProvider);

    ref.listen<AsyncValue<String?>>(deleteEventProvider, ( prev, next) {

      if(prev != next  && next.hasError)
      {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return InfoDialogViewGet(message: next.error.toString() ,
              onPressed: ()
              {
                Navigator.of(context).pop();
              },

            );
          },
        );
      }

      if(prev != next && next.valueOrNull != null )
      {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          const SnackBar(
            content: TextView(title:  AppStrings.deleteSuccessfully,
              textColor:  Colors.white, alignment: Alignment.center,),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.primaryColor,
            margin: EdgeInsets.all(20),
            shape: StadiumBorder(),
          ),
        );
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

        context.goNamed(AppRoutesName.setEventScreen);
      },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add,
        size: 22,
          color: Colors.white,
        ),
      
      ),
      appBar: const CustomAppbar(title: AppStrings.eventy,
        hasArrow: false,
      ),
      body: Center(
        child: homePageStateNotifier.when(
            data: (final valueOrNull) => valueOrNull.isEmpty ? const ErrorView(
              message: ExceptionStrings.noDataAvailable,
            ) :

            Center(
              child: SizedBox(
                width: Responsive.setWidthByPercentage(85),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: homePageStateNotifier.valueOrNull!.length,
                    itemBuilder: (BuildContext context, int index) {EventModel eventModel = homePageStateNotifier.valueOrNull![index];
                   return    ListTile(
                     isThreeLine: false,
                     contentPadding: const  EdgeInsets.symmetric(  vertical: 6) +  const  EdgeInsets.only(left: 15, right: 10),
                     onTap: ()
                     {
                       context.goNamed(AppRoutesName.setEventScreen,
                           extra: {
                             "event" : eventModel
                           });
                     },
                     leading: TextView(title: "${index + 1}.",
                     ),
                     title: TextView(
                     title:   eventModel.title ?? '',
                       style: AppTextStyle.eventTitleStyle,

                     ),
                     // subtitle: TextView(
                     //   title:   eventModel.description ?? '',
                     //   maxLine: 2,
                     //   overflow: TextOverflow.ellipsis,
                     //   style: AppTextStyle.eventDescriptionStyle,
                     //
                     // ),
                     dense: true,

                     trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(deleteEventProvider.notifier)
                                      .deleteEvent(eventModel.id.toString());
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          );
                    }),
              ),
            ),
            error: (e, s) =>  ErrorView(
              message: e.toString()
            ) ,
            loading: () => const CustomLoader()),
      ),
        );
  }

}

import 'package:event_planner/config/routes/routes.dart';
import 'package:event_planner/core/utils/utils.dart';
import 'package:event_planner/domain/entities/models/event_model.dart';
import 'package:event_planner/presentation/common_widgets/common_widgets.dart';
import 'package:event_planner/presentation/features/set_event/controller/set_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SetEventScreen extends ConsumerStatefulWidget {
  final EventModel? eventModelParam;
  const SetEventScreen({super.key ,  this.eventModelParam});

  @override
  ConsumerState createState() => _SetEventScreenState();
}

class _SetEventScreenState extends ConsumerState<SetEventScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _textEditingControllerTitle;
  late final TextEditingController _textEditingControllerDescription;
  late final TextEditingController _textEditingControllerDateTime;
  late DateTime selectedDate;


  @override
  void initState() {
    super.initState();
    _textEditingControllerTitle = TextEditingController();
    _textEditingControllerDescription = TextEditingController();
    _textEditingControllerDateTime = TextEditingController();

    if(widget.eventModelParam != null)
      {
        _textEditingControllerTitle.text = widget.eventModelParam?.title ?? '';
        _textEditingControllerDescription.text = widget.eventModelParam?.description ?? '';
        _textEditingControllerDateTime.text = DateFormatters.fullDateFormat.format(DateTime.parse(widget.eventModelParam?.createdAt ?? ''));
        selectedDate = DateTime.parse(widget.eventModelParam?.createdAt ?? '');
      }

    selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _textEditingControllerTitle.dispose();
    _textEditingControllerDescription.dispose();
    _textEditingControllerDateTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<AsyncValue<EventModel?>>(setEventProvider, ( prev, next) {

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
        context.goNamed(AppRoutesName.homeScreen);
      }
    });


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(
        title: widget.eventModelParam != null ?
        AppStrings.updateEvent :
        AppStrings.addEvent,
        onBackPressed: () {
          context.goNamed(AppRoutesName.homeScreen);
        },
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Center(
                child: SizedBox(
                  width: Responsive.setWidthByPercentage(80),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextField(
                          context: context,
                          onChanged: (value) {},
                          headingText: AppStrings.title,
                          controller: _textEditingControllerTitle,
                          validator: Validator.validateEmpty,
                          margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                          maxLimit: 100,
                        ),
                        AppTextField(
                          controller: _textEditingControllerDateTime,
                          context: context,
                          onChanged: (value) {

                          },
                          readOnly: true,
                          validator: Validator.validateEmpty,
                          onTap: () async {

                        DateTime? datetime   = await  showDateTimePicker(
                              context: context,
                              firstDate:  DateTime.now(),
                              initialDate: DateTime.now()

                            );

                        if(datetime != null)
                          {
                            selectedDate = datetime;
                            _textEditingControllerDateTime.text = DateFormatters
                                .fullDateFormat
                                .format(datetime);
                          }


                          },
                          headingText: AppStrings.eventDate,
                          margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                        ),
                        AppTextField(
                          context: context,
                          onChanged: (value) {},
                          headingText: AppStrings.description,
                          keyboard: TextInputType.multiline,
                          controller: _textEditingControllerDescription,
                          validator: Validator.validateEmpty,
                          margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                          isMultilineField: true,
                          maxLimit: 500,
                          minLines: 1,
                          maxLines: 4,
                        ),

                        SizedBox(
                          height: Responsive.setHeightByPercentage(20),
                        ),


                        Consumer(builder: (context, ref, child) {
                          final notifier = ref.watch(setEventProvider);

                          return notifier.isLoading ? const CustomLoader() : AppButton(
                              title: AppStrings.save,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // If event already exist then we update that event
                                  if (widget.eventModelParam != null) {
                                    EventModel eventModel = EventModel(createdAt: selectedDate.toIso8601String(),
                                      title: _textEditingControllerTitle.text,
                                      description: _textEditingControllerDescription.text,
                                    id: widget.eventModelParam?.id??'');
                                    ref.read(setEventProvider.notifier).updateEvent(eventModel);
                                  }
                                  else{
                                    EventModel eventModel = EventModel(
                                        createdAt: selectedDate.toIso8601String(),
                                      title: _textEditingControllerTitle.text,
                                      description: _textEditingControllerDescription.text,
                                    );
                                    ref.read(setEventProvider.notifier).addEvent(eventModel);
                                  }

                                }
                              });

                        }),


                      ]),
                ),
              ),
            ),
          )),
    );
  }
}

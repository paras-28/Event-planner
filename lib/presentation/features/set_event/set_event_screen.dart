import 'package:event_planner/config/routes/app_router.dart';
import 'package:event_planner/config/routes/app_routes_name.dart';
import 'package:event_planner/core/utils/app_date_picker.dart';
import 'package:event_planner/core/utils/app_strings.dart';
import 'package:event_planner/core/utils/date_formatters.dart';
import 'package:event_planner/core/utils/responsive_util.dart';
import 'package:event_planner/core/utils/validator.dart';
import 'package:event_planner/presentation/common_widgets/app_button.dart';
import 'package:event_planner/presentation/common_widgets/app_text_fields.dart';
import 'package:event_planner/presentation/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetEventScreen extends StatefulWidget {
  const SetEventScreen({super.key});

  @override
  State<SetEventScreen> createState() => _SetEventScreenState();
}

class _SetEventScreenState extends State<SetEventScreen> {


  final _formKey = GlobalKey<FormState>();

 late final  TextEditingController _textEditingControllerTitle;
 late final  TextEditingController _textEditingControllerDescription;
 late final  TextEditingController _textEditingControllerDateTime;


  @override
  void initState() {
    super.initState();
    _textEditingControllerTitle= TextEditingController();
    _textEditingControllerDescription= TextEditingController();
    _textEditingControllerDateTime= TextEditingController();

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

    return  Scaffold(
     appBar: CustomAppbar(title: AppStrings.addEvent,
     onBackPressed: ()
       {
         context.goNamed(AppRoutesName.homeScreen);
       },
     ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Center(
          child: SizedBox(
            width: Responsive.setWidthByPercentage(80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             children :  [

               AppTextField(
                 context: context,
                 onChanged: (value)
                 {},
                 headingText: AppStrings.title,
                 controller: _textEditingControllerTitle,
                 validator: Validator.validateEmpty,
                 margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                 maxLimit: 100,

               ),
               AppTextField(
                 context: context,
                 onChanged: (value)
                 {},
                 headingText: AppStrings.description,
                 keyboard: TextInputType.multiline,
                 controller: _textEditingControllerDescription,
                 validator: Validator.validateEmpty,
                 margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                 isMultilineField: true,
                 maxLimit: 500,
                 minLines: 2,
                 maxLines: 8,
               ),
               AppTextField(
                 controller: _textEditingControllerDateTime,
                    context: context,
                    onChanged: (value) {},
                    readOnly: true,
                    validator: Validator.validateEmpty,
                    onTap: () async {
                      await appDatePicker(
                          context: context,
                          onDateSelect: (DateTime dateTime) {

                            _textEditingControllerDateTime.text
                                = DateFormatters.formatterddMMYYYY.format(dateTime);
                          },
                          selectedDate: DateTime.now(),
                          isLastDateIsCurrentDay: true);
                    },
                 headingText: AppStrings.eventDate,
                 margin: EdgeInsets.only(top: Responsive.setHeight(30)),
                  ),
                 SizedBox(
                   height: Responsive.setHeightByPercentage(20),
                 ),
               AppButton(title: AppStrings.save,
                   onPressed: ()
               {
                 if(_formKey.currentState!.validate())
                   {

                   }
               }

               ),
           
                ]
            ),
          ),
        ),
      )),
    );

  }
}

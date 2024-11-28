import 'dart:core';
import 'dart:developer';

import 'package:event_planner/core/utils/is_list_exist.dart';
import 'package:event_planner/core/utils/validator.dart';
import 'package:event_planner/presentation/common_widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTextField extends StatefulWidget {
   String? hint;
   String? headingText;

  TextEditingController? controller;
  final EdgeInsets margin;
  AutovalidateMode autoValidateMode;
  late FocusNode? focusNode;
  List<String>? autoFills;
  BuildContext context;
  String? initialValue;
  bool enable;
  Function? validator;
  bool readOnly;
  Widget? suffixIcon;
  Icon? prefixIcon;
  double? width;
  double? height;
  double hintTextFontSize;
  Color fillColor;
  List<TextInputFormatter>? inputFormatter;
  Function()? onTap;
  int maxLimit;
  Function(String) onChanged;
  Function()? onEditing;
  Function(String)? onSubmitted;
  bool isPassword;
  double borderRadius;
  Color? borderColor;
  TextInputType? keyboard;
  TextStyle? textStyle;
  int minLines;
  int maxLines;
  bool isMultilineField;
  Color headingTextColor;

  AppTextField(
      {super.key,
      this.controller,
      this.headingText,
      this.headingTextColor = Colors.black,
      required this.context,
      required this.onChanged,
      this.onSubmitted,
      this.textStyle,
      this.onEditing,
      this.hint,
      this.hintTextFontSize = 16,
      this.enable = true,
      this.validator,
      this.focusNode,
      this.suffixIcon,
      this.width,
        this.height,
      this.inputFormatter,
      this.onTap,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.maxLimit = 10000,
      this.autoFills,
      this.isPassword = false,
      this.borderColor,
      this.prefixIcon,
      this.keyboard = TextInputType.text,
      this.initialValue,
      this.readOnly = false,
      this.fillColor = Colors.white,
      this.borderRadius = 8.0,
      this.margin = EdgeInsets.zero,
      this.minLines = 1,
      this.maxLines = 1,
        this.isMultilineField = false

      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (stringHasValue(widget.headingText)) ...[
            TextView(
              title: widget.headingText!,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              margin: const EdgeInsets.only(bottom: 6),
              textColor: widget.headingTextColor,
            ),
          ],
          TextFormField(
              autofillHints: widget.autoFills,
              onTap: () {
                log('speed${widget.onTap}');
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              initialValue: widget.initialValue,
              autovalidateMode: widget.autoValidateMode,
              onFieldSubmitted: (val) {
                if (widget.onSubmitted != null) {
                  widget.onSubmitted!(val);
                }
              },
              style: widget.textStyle ??
                  const TextStyle(
                      fontSize: 16,
                      color: Color(0xff010001),
                      //TODO
                      fontFamily: ""),
              keyboardType: widget.keyboard,
              controller: widget.controller,
              obscureText: widget.isPassword,
              validator: (val) {
                if (widget.validator != null) {
                  return widget.validator!(val);
                }
                else if (val.toString().isNotEmpty) {
                  return Validator.validateEmpty(val);
                }
                else {
                  return null;
                }
              },
              onChanged: widget.onChanged,
              inputFormatters: widget.inputFormatter,
              maxLength: widget.maxLimit,
              minLines: widget.minLines,
              maxLines:   widget.maxLines,
              readOnly: widget.readOnly,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  counterText: '',
                  filled: true,
                  contentPadding:  widget.isMultilineField? const EdgeInsets.symmetric(horizontal: 12 ,
                  vertical: 8
                  ):const EdgeInsets.symmetric(horizontal: 12),
                  hintText: widget.hint ?? '',
                  fillColor: widget.fillColor,
                  errorMaxLines: 3,
                  errorStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontFamily: ''),
                  hintStyle: TextStyle(
                      fontSize: widget.hintTextFontSize,
                      color: const Color(0xff9f9e9f),
                      fontWeight: FontWeight.w500,
                      fontFamily: ''),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  enabled: widget.enable,
                  suffixIcon: widget.suffixIcon,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.grey, width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.grey, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ))),
        ],
      ),
    );
  }
}

import 'dart:core';
import 'dart:developer';

import 'package:event_planner/core/utils/is_list_exist.dart';
import 'package:event_planner/core/utils/validator.dart';
import 'package:event_planner/presentation/common_widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTextField extends StatefulWidget {
  final  String? hint;
  final  String? headingText;

  final TextEditingController? controller;
  final  EdgeInsets margin;
  final AutovalidateMode autoValidateMode;
  final  FocusNode? focusNode;
  final List<String>? autoFills;
  final BuildContext context;
  final String? initialValue;
  final bool enable;
  final Function? validator;
  final bool readOnly;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final double? width;
  final double? height;
  final double hintTextFontSize;
  final Color fillColor;
  final List<TextInputFormatter>? inputFormatter;
  final Function()? onTap;
  final int maxLimit;
  final Function(String) onChanged;
  final Function()? onEditing;
 final  Function(String)? onSubmitted;
 final  bool isPassword;
 final  double borderRadius;
 final  Color? borderColor;
 final  TextInputType? keyboard;
 final  TextStyle? textStyle;
 final  int minLines;
 final  int maxLines;
 final  bool isMultilineField;
 final  Color headingTextColor;

 const  AppTextField(
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
              minLines: widget.isMultilineField ? null : widget.minLines,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'text_style.dart';

Widget textInput(
  BuildContext context,
  TextEditingController? controller, {
  int? maxLength,
  int? maxLine,
  double? borderRadiusValue,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  TextStyle? suffixStyle,
  TextStyle? prefixStyle,
  TextAlign? textAlign,
  String? hintText,
  String? errorText,
  String? defaultText,
  String? helperText,
  String? suffixText,
  double? contentTop,
  Widget? icon,
  bool? obscureText,
  Color? fillColor,
  Color? borderColor,
  TextInputType? inputType,
  TextInputAction? inputAction,
  List<TextInputFormatter>? inputFormatter,
  String? validateText,
  void Function(String)? onChanged,
}) =>
    SizedBox(
      child: TextFormField(
        maxLines: maxLine ?? 1,
        maxLength: maxLength,
        textInputAction: inputAction,
        inputFormatters: inputFormatter,
        keyboardType: inputType,
        controller: controller,
        validator: (value) => value!.isEmpty ? validateText : null,
        obscureText: obscureText ?? false,
        autofocus: false,
        style: regulartextStyle(14),
        cursorColor: primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          contentPadding: EdgeInsets.only(left: 16, top: contentTop ?? 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? primaryColor,
            ),
            borderRadius: BorderRadius.circular(
              borderRadiusValue ?? 12,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(
              borderRadiusValue ?? 12,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              borderRadiusValue ?? 12,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              borderRadiusValue ?? 12,
            ),
          ),
          hintText: hintText ?? "Your Text",
          hintStyle: hintStyle ?? regulartextStyle(14, colorGray400),
          errorText: errorText,
          prefixText: defaultText,
          prefixStyle: prefixStyle,
          helperText: helperText,
          suffixIcon: icon,
          suffixIconColor: primaryColor,
          suffixStyle: suffixStyle,
          suffixText: suffixText,
        ),
        onChanged: onChanged,
      ),
    );

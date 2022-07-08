// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.formKey,
    this.textAlign,
    this.controller,
    this.keyboardType,
    this.enabled,
    this.inputFormatters,
    this.validator,
    this.style,
    this.autofocus,
    this.obscureText,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.prefixIcon,
    this.hintText,
    this.radius,
    this.labelText,
    this.alignLabelWithHint,
    this.focusNode,
    this.initialValue,
    this.backgroundColor,
    this.widthField,
    this.heightButton,
  }) : super(key: key);

  final TextAlign? textAlign;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Function? validator;
  final TextStyle? style;
  final bool? autofocus;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onChanged;
  final int? maxLines;
  final int? maxLength;
  final formKey;
  final String? hintText;
  final double? radius;
  final String? labelText;
  final bool? alignLabelWithHint;
  final FocusNode? focusNode;
  final String? initialValue;
  final Color? backgroundColor;
  final double? widthField;
  final double? heightButton;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: widthField ?? MediaQuery.of(context).size.width * 0.95,
        child: TextFormField(
          onFieldSubmitted: (v) {
            print(v);
          },
          key: formKey,
          focusNode: focusNode,
          onChanged: onChanged as void Function(String)?,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 0,
              top: 15,
            ),
            errorStyle: const TextStyle(fontSize: 12, height: 0.6),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelText: labelText,
            alignLabelWithHint: alignLabelWithHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            fillColor: backgroundColor,
            filled: backgroundColor == null ? false : true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? 10,
              ),
            ),
          ),
          style: style ??
              TextStyle(
                color: Colors.black54,
                fontSize: screenHeight * 0.023,
                fontWeight: FontWeight.w500,
              ),
          textAlign: textAlign ?? TextAlign.left,
          controller: controller,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          enabled: enabled ?? true,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator as String? Function(String?)?,
          autofocus: autofocus ?? false,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
        ),
      ),
    );
  }
}

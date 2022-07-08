import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final textButton;
  final double? sizeText;
  final double? widthButton;
  final double? heightButton;
  final Color? colorButton;
  final Color? colorTextButton;
  final RoundedRectangleBorder? borderButton;

  const CustomElevatedButton({
    required this.onPressed,
    this.textButton,
    this.sizeText,
    this.widthButton,
    this.heightButton,
    this.colorButton,
    this.colorTextButton,
    this.borderButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthButton ?? 230,
      height: heightButton ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: borderButton ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
          primary: colorButton ?? const Color.fromARGB(255, 35, 105, 148),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textButton ?? ' ',
              style: TextStyle(
                fontSize: sizeText ?? 16,
                fontWeight: FontWeight.w600,
                color: colorTextButton ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent(
      {super.key,
      required this.title,
      this.onPress,
      required this.backgroundColor,
      required this.width,
      required this.height,
      this.btnHorizontalPadding,
      this.btnVerticalPadding,
      this.borderRadius,
      this.borderColor,
      required this.textStyle});

  final String title;
  final VoidCallback? onPress;
  final Color backgroundColor;
  final double width;
  final double height;
  final double? btnHorizontalPadding;
  final double? btnVerticalPadding;
  final double? borderRadius;
  final Color? borderColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  side: BorderSide(color: borderColor ?? Colors.transparent),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0.0))),
              alignment: Alignment.center,
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: btnHorizontalPadding ?? 20,
                  vertical: btnVerticalPadding ?? 10)),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              backgroundColor: WidgetStatePropertyAll(backgroundColor)),
          onPressed: () {
            onPress!();
          },
          child: Text(
            title,
            style: textStyle,
          )),
    );
  }
}

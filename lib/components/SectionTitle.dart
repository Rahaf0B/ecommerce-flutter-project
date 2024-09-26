import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.text,
      required this.showView,
      this.textColor,
      this.titleFontSize});
  final String text;
  final bool showView;
  final Color? textColor;
  final double? titleFontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                    fontFamily: KTextFont,
                    fontSize: titleFontSize ?? 15,
                    color: textColor ?? KTextDarkColor,
                    fontWeight: FontWeight.w600)),
            showView
                ? TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0))),
                    icon: const Icon(Icons.keyboard_arrow_right_outlined,
                        color: KPrimaryColor),
                    label: const Text(
                      'View all',
                      style: TextStyle(color: KPrimaryColor),
                    ),
                    iconAlignment: IconAlignment.end,
                  )
                : Container(),
          ]),
    );
  }
}

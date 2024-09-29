import 'package:ecommerce/Constants/Enums.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.title,
      required this.showView,
      this.textColor,
      this.titleFontSize,
      this.pageType,
      this.onTap,
      this.subPageType});
  final String title;
  final bool showView;
  final Color? textColor;
  final double? titleFontSize;
  final PageType? pageType;
  final Function? onTap;
  final SubPageType? subPageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    fontFamily: KTextFont,
                    fontSize: titleFontSize ?? 15,
                    color: textColor ?? KTextDarkColor,
                    fontWeight: FontWeight.w600)),
            showView
                ? TextButton.icon(
                    onPressed: onTap == null
                        ? () {}
                        : () {
                            if (pageType != null && subPageType != null) {
                              onTap!(
                                  pageType: pageType,
                                  id: 0,
                                  subPageType: subPageType,
                                  pageName: title);
                            }
                          },
                    style: ButtonStyle(
                        padding:
                            WidgetStateProperty.all(const EdgeInsets.all(0))),
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

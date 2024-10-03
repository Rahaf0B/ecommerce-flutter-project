import 'package:ecommerce/Constants/Enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'Devices.dart';

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
                    fontSize: titleFontSize ??
                        (Devices.IsDesktop(context) ? 5.sp : 13.sp),
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
                    icon: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: KPrimaryColor,
                      size: Devices.IsDesktop(context) ? 8.w : 25.w,
                    ),
                    label: Text(
                      'View all',
                      style: TextStyle(
                          color: KPrimaryColor,
                          fontSize: Devices.IsDesktop(context) ? 4.sp : 12.sp),
                    ),
                    iconAlignment: IconAlignment.end,
                  )
                : Container(),
          ]),
    );
  }
}

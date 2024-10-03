import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/Enums.dart';
import 'Devices.dart';

class UpperContentBannerCategory extends StatelessWidget {
  const UpperContentBannerCategory(
      {super.key,
      required this.subTitle,
      required this.containerAlignment,
      required this.textIconColor,
      required this.btnColor,
      this.containerWidth,
      required this.direction,
      this.onTap,
      this.id,
      this.dealType,
      this.pageType,
      this.title,
      this.pageTitle});
  final String? title;
  final String subTitle;
  final Color textIconColor;
  final Color btnColor;
  final Alignment containerAlignment;
  final double? containerWidth;
  final Direction direction;
  final Function? onTap;
  final PageType? pageType;
  final int? id;
  final SubPageType? dealType;
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: containerAlignment,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: direction == Direction.left ? 15 : 0,
          right: direction == Direction.right ? 15 : 0),
      child: Container(
        constraints:
            BoxConstraints(maxWidth: containerWidth ?? Size.infinite.width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title != null
                ? Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: textIconColor,
                        fontSize: Devices.IsDesktop(context) ? 7.sp : 10.sp),
                  )
                : SizedBox(),
            const SizedBox(height: 2),
            Text(
              subTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textIconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Devices.IsDesktop(context) ? 7.sp : 15.sp),
            ),
            const SizedBox(height: 20),
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: onTap == null
                    ? () {}
                    : () {
                        if (dealType != null &&
                            pageType != null &&
                            pageTitle != null) {
                          onTap!(
                              pageType: pageType,
                              id: 0,
                              subPageType: dealType,
                              pageName: pageTitle);
                        }
                      },
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: textIconColor,
                  size: Devices.IsDesktop(context) ? 12.w : 25.w,
                ),
                color: textIconColor,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(btnColor),
                ))
          ],
        ),
      ),
    );
  }
}

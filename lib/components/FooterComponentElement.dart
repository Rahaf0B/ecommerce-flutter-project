import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/FooterData.dart';
import '../Constants/TextStyle.dart';
import 'Devices.dart';

class FooterComponentElement extends StatelessWidget {
  const FooterComponentElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KPrimaryColor,
      child: Flex(
          direction:
              Devices.IsMobile(context) ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: Devices.IsMobile(context)
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: KPageHorizontalPadding),
              child: Flex(
                direction:
                    Devices.IsMobile(context) ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shop by Category",
                        style: KTextFooterMainTitleStyle,
                      ),
                      Devices(
                        mobile: SizedBox(),
                        desktop: SizedBox(
                          height: 20.h,
                        ),
                      ),
                      for (var item in shopCategory) ...[
                        Devices(
                            mobile: SizedBox(),
                            desktop: SizedBox(
                              height: 10,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            child: item,
                            onTap: () {},
                          ),
                        )
                      ]
                    ],
                  ),
                  Devices(
                    mobile: SizedBox(
                      height: 24.h,
                    ),
                    desktop: SizedBox(
                      width: 30.w,
                    ),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Policy",
                        style: KTextFooterMainTitleStyle,
                      ),
                      SizedBox(
                        height: Devices.IsDesktop(context) ? 20.h : 5.h,
                      ),
                      Wrap(
                          direction: Devices.IsDesktop(context)
                              ? Axis.vertical
                              : Axis.horizontal,
                          crossAxisAlignment: Devices.IsDesktop(context)
                              ? WrapCrossAlignment.start
                              : WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: [
                            for (var i = 0; i < policy.length; i++) ...[
                              GestureDetector(
                                child: policy[i],
                                onTap: () {},
                              ),
                              i != policy.length - 1
                                  ? SizedBox(
                                      height: 15,
                                      child: Devices.IsDesktop(context)
                                          ? SizedBox()
                                          : VerticalDivider(
                                              color: KSubTextColor,
                                              width: 10,
                                            ))
                                  : Container(),
                            ]
                          ]),
                    ],
                  ),
                  Devices(
                    mobile: SizedBox(
                      height: 36.h,
                    ),
                    desktop: SizedBox(
                      width: 30.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "About",
                        style: KTextFooterMainTitleStyle,
                      ),
                      SizedBox(
                        height: Devices.IsDesktop(context) ? 20.h : 5.h,
                      ),
                      Wrap(
                          direction: Devices.IsMobile(context)
                              ? Axis.horizontal
                              : Axis.vertical,
                          crossAxisAlignment: Devices.IsMobile(context)
                              ? WrapCrossAlignment.center
                              : WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          children: [
                            for (var item in about) ...[
                              item,
                              SizedBox(
                                height: 15.h,
                                child: Devices.IsMobile(context)
                                    ? VerticalDivider(
                                        color: KSubTextColor,
                                        width: 10.w,
                                      )
                                    : SizedBox(),
                              ),
                            ]
                          ]),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: KPrimaryTintColor, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: KPageHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: socialContact,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "${KIconsPath}location.svg",
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "United States",
                          style: TextStyle(color: KBrightColor, fontSize: 16),
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "© 2021 | Cora Leviene All Rights Reserved",
                    style: TextStyle(color: KSubTextColor),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}

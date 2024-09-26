import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/FooterData.dart';
import '../Constants/TextStyle.dart';

class FooterComponentElement extends StatelessWidget {
  const FooterComponentElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KPrimaryColor,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: KPageHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shop by Category",
                    style: KTextFooterMainTitleStyle,
                  ),
                  for (var item in shopCategory)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: GestureDetector(
                        child: item,
                        onTap: () {},
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Policy",
                    style: KTextFooterMainTitleStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        for (var i = 0; i < policy.length; i++) ...[
                          GestureDetector(
                            child: policy[i],
                            onTap: () {},
                          ),
                          i != policy.length - 1
                              ? const SizedBox(
                                  height: 15,
                                  child: VerticalDivider(
                                    color: KSubTextColor,
                                    width: 10,
                                  ),
                                )
                              : Container(),
                        ]
                      ]),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: KTextFooterMainTitleStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        for (var item in about) ...[
                          item,
                          const SizedBox(
                            height: 15,
                            child: VerticalDivider(
                              color: KSubTextColor,
                              width: 10,
                            ),
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
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: KPageHorizontalPadding),
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
                      style: TextStyle(color: KTextBrightColor, fontSize: 16),
                    )
                  ]),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "© 2021 | Cora Leviene All Rights Reserved",
                style: TextStyle(color: KSubTextColor),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

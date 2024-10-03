import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'CardBanner.dart';
import 'Devices.dart';
import 'UpperContentBannerCategory.dart';

class SectionCardBannerCategory extends StatelessWidget {
  const SectionCardBannerCategory({super.key, required this.type, this.onTap});

  final PageType type;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Devices.IsDesktop(context) ? 0.6.sh : 0.5.sh,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: CardBanner(
                width: double.infinity,
                image_url: "${KImagesPath}lifestyle.png",
                upperComponent: UpperContentBannerCategory(
                  onTap: onTap!,
                  pageType: type,
                  dealType: SubPageType.limited,
                  pageTitle: "Limited Edition",
                  direction: Direction.left,
                  title: "LIFESTYLE",
                  subTitle: "limited edition products",
                  btnColor: const Color(0x2297451F),
                  textIconColor: const Color(0xFF97451F),
                  containerWidth: 180.w,
                  containerAlignment: Alignment.centerLeft,
                )),
          ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
            flex: 2,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: CardBanner(
                      image_url: "${KImagesPath}skincare.png",
                      upperComponent: UpperContentBannerCategory(
                        onTap: onTap!,
                        dealType: SubPageType.discount,
                        direction: Direction.right,
                        pageTitle: "15% Discount",
                        pageType: type,
                        subTitle: "15% Off And More!",
                        btnColor: const Color(0x22A53F64),
                        textIconColor: const Color(0xFFA53F64),
                        containerWidth: 80.w,
                        containerAlignment: Alignment.topRight,
                      )),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Flexible(
                  flex: 1,
                  child: CardBanner(
                      image_url: "${KImagesPath}facepacks.png",
                      upperComponent: UpperContentBannerCategory(
                        onTap: onTap!,
                        dealType: SubPageType.popular,
                        pageTitle: "Popular Products",
                        pageType: type,
                        direction: Direction.right,
                        subTitle: "Popular On The Community!",
                        btnColor: const Color(0x22A53F64),
                        textIconColor: const Color(0xFFA53F64),
                        containerWidth: 80.w,
                        containerAlignment: Alignment.topRight,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

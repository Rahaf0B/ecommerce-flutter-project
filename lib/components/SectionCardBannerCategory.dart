import 'package:flutter/material.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'CardBanner.dart';
import 'UpperContentBannerCategory.dart';

class SectionCardBannerCategory extends StatelessWidget {
  const SectionCardBannerCategory({super.key, required this.type, this.onTap});

  final PageType type;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          CardBanner(
              width: double.infinity,
              height: 180,
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
                containerWidth: 180,
                containerAlignment: Alignment.centerLeft,
              )),
          const SizedBox(
            height: 16,
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: CardBanner(
                    width: 190,
                    height: 150,
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
                      containerWidth: 80,
                      containerAlignment: Alignment.topRight,
                    )),
              ),
              Flexible(
                flex: 1,
                child: CardBanner(
                    width: 190,
                    height: 150,
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
                      containerWidth: 80,
                      containerAlignment: Alignment.topRight,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

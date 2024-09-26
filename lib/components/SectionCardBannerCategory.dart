import 'package:flutter/material.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'CardBanner.dart';
import 'UpperContentBannerCategory.dart';

class SectionCardBannerCategory extends StatelessWidget {
  const SectionCardBannerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 350,
      child: Column(
        children: [
          CardBanner(
              width: double.infinity,
              height: 180,
              image_url: "${KImagesPath}lifestyle.png",
              upperComponent: UpperContentBannerCategory(
                direction: Direction.left,
                title: "LIFESTYLE",
                subTitle: "Makeup Accessories from Top Brands",
                btnColor: Color(0x2297451F),
                textIconColor: Color(0xFF97451F),
                containerWidth: 180,
                containerAlignment: Alignment.centerLeft,
              )),
          SizedBox(
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
                      direction: Direction.right,
                      subTitle: "Skincare Essentials",
                      btnColor: Color(0x22A53F64),
                      textIconColor: Color(0xFFA53F64),
                      containerWidth: 80,
                      containerAlignment: Alignment.topRight,
                    )),
              ),
              Flexible(
                flex: 1,
                child: CardBanner(
                    width: 190,
                    height: 150,
                    image_url: "${KImagesPath}skincare.png",
                    upperComponent: UpperContentBannerCategory(
                      direction: Direction.right,
                      subTitle: "Skincare Essentials",
                      btnColor: Color(0x22A53F64),
                      textIconColor: Color(0xFFA53F64),
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

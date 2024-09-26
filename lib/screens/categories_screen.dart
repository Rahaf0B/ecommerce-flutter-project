import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';

import '../Constants/Enums.dart';
import '../components/CardBanner.dart';
import '../components/UpperContentBannerCategory.dart';

class CategoriesScreen extends StatelessWidget {
  static String route = "categories";
  CategoriesScreen({super.key});

  List<Map<int, Map<String, String>>> cards = [
    {
      1: {"Skincare": "${KImagesPath}catSkincare.png"}
    },
    {
      2: {"Fragrance": "${KImagesPath}catFragrance.png"}
    },
    {
      3: {"Handbags": "${KImagesPath}catHandbags.png"}
    },
    {
      4: {"Eyewear": "${KImagesPath}catEyewear.png"}
    },
    {
      5: {"Apparels": "${KImagesPath}catApparels.png"}
    },
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "Categories",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: ListView(
          children: [
            for (var item in cards) ...[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: CardCatComponent(
                  id: item.keys.first,
                  title: item.values.first.entries.first.key,
                  img_url: item.values.first.entries.first.value,
                ),
              ),
            ]
          ],
        ),
      ),
    ));
  }
}

class CardCatComponent extends StatelessWidget {
  const CardCatComponent({
    super.key,
    required this.title,
    required this.img_url,
    required this.id,
  });
  final String title;
  final String img_url;
  final int id;

  @override
  Widget build(BuildContext context) {
    return CardBanner(
        width: double.infinity,
        height: 145,
        image_url: img_url,
        upperComponent: Container(
          padding: EdgeInsets.only(right: 20),
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(color: KBrightColor, fontSize: 22),
          ),
          alignment: Alignment.centerRight,
        ));
  }
}

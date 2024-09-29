import 'package:ecommerce/Constants/Enums.dart';
import 'package:ecommerce/components/GridViewCreator.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Models/Category.dart';
import '../Models/Figure.dart';
import 'CollectionCard.dart';

class Handpicked extends StatefulWidget {
  const Handpicked({super.key, this.onTap});
  final Function? onTap;
  @override
  State<Handpicked> createState() => _HandpickedState();
}

class _HandpickedState extends State<Handpicked> {
  late List<Category> _cardCollectionData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _cardCollectionData = [
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KImagesPath}handbag.png"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KImagesPath}handbag.png"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KImagesPath}handbag.png"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KImagesPath}handbag.png"),
          category_id: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: double.infinity,
      color: KPrimaryColor,
      padding: const EdgeInsets.symmetric(
          vertical: 20, horizontal: KPageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Handpicked Collections",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: KBrightColor),
          ),
          const SizedBox(
            height: 15,
          ),
          Gridviewcreator(
            numberOfColumns: 2,
            numberOfRows: _cardCollectionData.length ~/ 2,
            children: [
              for (var item in _cardCollectionData)
                Collectioncard(
                  type: PageType.subCategory,
                  onTap: widget.onTap,
                  id: item.category_id,
                  title: item.name,
                  img_url: item.image.url,
                ),
            ],
          )
        ],
      ),
    );
  }
}

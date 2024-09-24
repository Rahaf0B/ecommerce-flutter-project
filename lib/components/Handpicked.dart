import 'package:ecommerce/components/GridViewCreator.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'CollectionCard.dart';

class Handpicked extends StatefulWidget {
  const Handpicked({super.key});

  @override
  State<Handpicked> createState() => _HandpickedState();
}

class _HandpickedState extends State<Handpicked> {
  late List<Collectioncard> cardCollectionData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardCollectionData = [
      Collectioncard(
        title: "Handbags",
        img_url: KImagesPath + "handbag.png",
      ),
      Collectioncard(
        title: "Handbags",
        img_url: KImagesPath + "handbag.png",
      ),
      Collectioncard(
        title: "Handbags",
        img_url: KImagesPath + "handbag.png",
      ),
      Collectioncard(
        title: "Handbags",
        img_url: KImagesPath + "handbag.png",
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: double.infinity,
      color: KPrimaryColor,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Handpicked Collections",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: KTextBrightColor),
          ),
          SizedBox(
            height: 15,
          ),
          Gridviewcreator(
            children: cardCollectionData!,
            numberOfColumns: 2,
            numberOfRows: (cardCollectionData!.length / 2).toInt(),
          )
        ],
      ),
    );
  }
}

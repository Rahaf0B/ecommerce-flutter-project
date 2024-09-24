import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'AvgRatingComponent.dart';
import 'BottomSheetOptionButtons.dart';
import 'ProductSubInfo.dart';

class BottomSheetProductSubInfoComponent extends StatefulWidget {
  const BottomSheetProductSubInfoComponent(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.img_url,
      required this.rating,
      required this.numberOfReviews});

  final String img_url;
  final String title;
  final String subTitle;
  final double price;
  final double rating;
  final int numberOfReviews;
  @override
  State<BottomSheetProductSubInfoComponent> createState() =>
      _BottomSheetProductSubInfoComponentState();
}

class _BottomSheetProductSubInfoComponentState
    extends State<BottomSheetProductSubInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KPageBackGroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(KBorderRadius),
          topRight: Radius.circular(KBorderRadius),
        ),
      ),
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.5 * .8 + 35,
      padding: EdgeInsets.all(20),
      // child: Container(
      // width: double.infinity,
      child: Column(
        children: [
          Container(
            // width: 120,
            child: Row(children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  child: Image.asset(
                    widget.img_url,
                    width: 120,
                    height: 120,
                  ),
                ),
                // width: double.infinity,
              ),
              SizedBox(
                width: 20,
              ),
              ProductSubInfo(
                elementType: ElementType.page,
                width: 1,
                marginTop: 5,
                title: widget.title,
                subTitle: widget.subTitle,
                price: widget.price,
              )
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          AvgRatingComponent(
            show_icon: true,
            numberOfReviews: widget.numberOfReviews,
            rating: widget.rating,
          ),
          SizedBox(
            height: 30,
          ),
          BottomSheetOptionButtons(
            btn_text: "Add to Bag",
            right_btn_img_url: KIconsPath + "bagIconOutline.svg",
            left_btn_img_url: KIconsPath + "placeholder.svg",
          )
        ],
      ),

      // ),
    );
  }
}

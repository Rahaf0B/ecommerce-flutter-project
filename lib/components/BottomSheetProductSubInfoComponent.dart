import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/screens/product_screen.dart';
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
      required this.numberOfReviews,
      required this.product_id});

  final String img_url;
  final String title;
  final String subTitle;
  final double price;
  final double rating;
  final int numberOfReviews;
  final int product_id;

  @override
  State<BottomSheetProductSubInfoComponent> createState() =>
      _BottomSheetProductSubInfoComponentState();
}

class _BottomSheetProductSubInfoComponentState
    extends State<BottomSheetProductSubInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KshowModalBottomSheetBackgroundColor,
      child: Container(
        decoration: const BoxDecoration(
          color: KPageBackGroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(KBorderRadius),
            topRight: Radius.circular(KBorderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding)
            .copyWith(top: 30, bottom: 10),
        child: Column(
          children: [
            Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductScreen.route,
                      arguments: ProductScreenArguments(
                          product_id: widget.product_id));
                },
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
              const SizedBox(
                width: 20,
              ),
              ProductSubInfo(
                elementType: ElementType.page,
                marginTop: 5,
                title: widget.title,
                subTitle: widget.subTitle,
                price: widget.price,
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            AvgRatingComponent(
                show_icon: true,
                numberOfReviews: widget.numberOfReviews,
                rating: widget.rating,
                product_id: widget.product_id),
            const SizedBox(
              height: 30,
            ),
            const BottomSheetOptionButtons(
              btn_text: "Add to Bag",
              right_btn_img_url: "${KIconsPath}bagIconOutline.svg",
              left_btn_img_url: "${KIconsPath}placeholder.svg",
            )
          ],
        ),
      ),
    );
  }
}

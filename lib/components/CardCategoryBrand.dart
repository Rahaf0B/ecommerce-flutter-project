import 'package:ecommerce/Constants/Enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class CardCategoryBrand extends StatefulWidget {
  const CardCategoryBrand(
      {super.key,
      required this.img_url,
      required this.containerHeight,
      required this.containerWidth,
      required this.id,
      required this.type,
      required this.title,
      this.showTitle = true,
      this.onTap});
  final String img_url;
  final String title;
  final double containerHeight;
  final double containerWidth;
  final Function? onTap;
  final int id;
  final PageType type;
  final bool? showTitle;
  @override
  State<CardCategoryBrand> createState() => _CardCategoryBrandState();
}

class _CardCategoryBrandState extends State<CardCategoryBrand> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap == null
              ? () {}
              : () {
                  widget.onTap!(
                      pageType: widget.type,
                      id: widget.id,
                      pageName: widget.title);
                },
          child: Container(
            width: widget.containerWidth,
            height: widget.containerHeight,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: KMiniCardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(KBorderRadius),
                )),
            margin: EdgeInsets.only(bottom: widget.title != null ? 5 : 0),
            child: SvgPicture.asset(
              widget.img_url,
              fit: BoxFit.contain,
            ),
          ),
        ),
        widget.showTitle! ? Text(widget.title) : Container(),
      ],
    );
  }
}

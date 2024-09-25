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
      this.text,
      this.onTap});
  final String img_url;
  final String? text;
  final double containerHeight;
  final double containerWidth;
  final Function? onTap;
  final int id;
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
                  widget.onTap!();
                },
          child: Container(
            width: widget.containerWidth,
            height: widget.containerHeight,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: KMiniCardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(KBorderRadius),
                )),
            margin: EdgeInsets.only(bottom: widget.text != null ? 5 : 0),
            child: SvgPicture.asset(widget.img_url),
          ),
        ),
        widget.text != null ? Text(widget.text!) : Container(),
      ],
    );
  }
}

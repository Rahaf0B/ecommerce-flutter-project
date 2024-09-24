import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class AvgRatingComponent extends StatefulWidget {
  const AvgRatingComponent(
      {super.key,
      required this.show_icon,
      required this.rating,
      required this.numberOfReviews});
  final bool show_icon;
  final double rating;
  final int numberOfReviews;

  @override
  State<AvgRatingComponent> createState() => _AvgRatingComponentState();
}

class _AvgRatingComponentState extends State<AvgRatingComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: widget.show_icon
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: KMiniCardColor,
                  borderRadius: BorderRadius.circular(KBorderRadius)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.rating.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    size: 40,
                    Icons.star_rounded,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Average Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.numberOfReviews.toString() + " Ratings & Reviews",
                      style: TextStyle(fontSize: 16, color: KGreyColor))
                ],
              ),
            ),
          ]),
          widget.show_icon
              ? IconButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: SvgPicture.asset(KIconsPath + "arrowRight.svg"))
              : Container()
        ],
      ),
    );
  }
}

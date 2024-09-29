import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/ScreensArguments.dart';

class AvgRatingComponent extends StatefulWidget {
  const AvgRatingComponent(
      {super.key,
      required this.show_icon,
      required this.rating,
      required this.numberOfReviews,
      required this.product_id});
  final bool show_icon;
  final double rating;
  final int numberOfReviews;
  final int product_id;

  @override
  State<AvgRatingComponent> createState() => _AvgRatingComponentState();
}

class _AvgRatingComponentState extends State<AvgRatingComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    size: 40,
                    Icons.star_rounded,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Average Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("${widget.numberOfReviews} Ratings & Reviews",
                      style: const TextStyle(fontSize: 16, color: KGreyColor))
                ],
              ),
            ),
          ]),
          widget.show_icon
              ? IconButton(
                  onPressed: widget.show_icon == false
                      ? () {}
                      : () {
                          Navigator.pushNamed(context, "reviews",
                              arguments: ReviewsScreenArguments(
                                  product_id: widget.product_id));
                        },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: SvgPicture.asset("${KIconsPath}arrowRight.svg"))
              : Container()
        ],
      ),
    );
  }
}

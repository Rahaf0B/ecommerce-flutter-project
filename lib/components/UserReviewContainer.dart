import 'package:ecommerce/Constants/Constant.dart';
import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Models/Review.dart';

class UserReviewContainer extends StatelessWidget {
  const UserReviewContainer({super.key, required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: KMiniCardColor,
                  borderRadius: BorderRadius.circular(KBorderRadius)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    review.rating_value.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    size: 30,
                    Icons.star_rounded,
                    color: KOrangeColor,
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
                    review.fisrt_name + " " + review.last_name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(review.date,
                      style: TextStyle(fontSize: 16, color: KGreyColor))
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            review.comment,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, color: KGreyColor),
          )
        ],
      ),
    );
  }
}

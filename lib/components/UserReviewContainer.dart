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
      padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Container(
              padding: const EdgeInsets.all(12),
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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    size: 30,
                    Icons.star_rounded,
                    color: KOrangeColor,
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
                  Text(
                    "${review.fisrt_name} ${review.last_name}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(review.date,
                      style: const TextStyle(fontSize: 16, color: KGreyColor))
                ],
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Text(
            review.comment,
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 15, color: KGreyColor),
          )
        ],
      ),
    );
  }
}

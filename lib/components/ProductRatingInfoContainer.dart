import 'package:ecommerce/Constants/Constant.dart';
import 'package:flutter/material.dart';
import 'package:rating_summary/rating_summary.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';

class ProductRatingInfoContainer extends StatelessWidget {
  const ProductRatingInfoContainer({
    super.key,
    required this.productName,
    required this.subTitle,
    required this.avgRating,
    required this.numberOfFiveStarRating,
    required this.numberOfFourStarRating,
    required this.numberOfThreeStarRating,
    required this.numberOfTwoStarRating,
    required this.numberOfOneStarRating,
  });

  final String productName;
  final String subTitle;
  final double avgRating;
  final int numberOfFiveStarRating;
  final int numberOfFourStarRating;
  final int numberOfThreeStarRating;
  final int numberOfTwoStarRating;
  final int numberOfOneStarRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productName),
          const SizedBox(
            height: 10,
          ),
          Text(subTitle),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(

                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        avgRating.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        size: 30,
                        Icons.star_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Average Rating",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ])),
          Container(
            width: MediaQuery.of(context).size.width ,
            padding: const EdgeInsets.only(right:45),
            child: RatingSummaryContainer(
                numberOfFiveStarRating: numberOfFiveStarRating,
                numberOfFourStarRating: numberOfFourStarRating,
                numberOfThreeStarRating: numberOfThreeStarRating,
                numberOfTwoStarRating: numberOfTwoStarRating,
                numberOfOneStarRating: numberOfOneStarRating),
          ),
        ],
      ),
    );
  }
}

class RatingSummaryContainer extends StatelessWidget {
  const RatingSummaryContainer({
    super.key,
    required this.numberOfFiveStarRating,
    required this.numberOfFourStarRating,
    required this.numberOfThreeStarRating,
    required this.numberOfTwoStarRating,
    required this.numberOfOneStarRating,
  });

  final int numberOfFiveStarRating;
  final int numberOfFourStarRating;
  final int numberOfThreeStarRating;
  final int numberOfTwoStarRating;
  final int numberOfOneStarRating;

  @override
  Widget build(BuildContext context) {
    return RatingSummary(
      color: KPrimaryColor,
      counter: 13,
      average: 3.846,
      label: "str",
      showAverage: false,
      counterFiveStars: numberOfFiveStarRating,
      counterFourStars: numberOfFourStarRating,
      counterThreeStars: numberOfThreeStarRating,
      counterTwoStars: numberOfTwoStarRating,
      counterOneStars: numberOfOneStarRating,
      labelCounterFiveStarsStyle: ratingLabelStyle,
      labelCounterFourStarsStyle: ratingLabelStyle,
      labelCounterOneStarsStyle: ratingLabelStyle,
      labelCounterThreeStarsStyle: ratingLabelStyle,
      labelCounterTwoStarsStyle: ratingLabelStyle,
      labelCounterFiveStars: "5.0",
      labelCounterFourStars: "4.0",
      labelCounterThreeStars: "3.0",
      labelCounterTwoStars: "2.0",
      labelCounterOneStars: "1.0",
    );
  }
}

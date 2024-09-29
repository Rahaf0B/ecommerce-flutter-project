import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Models/Review.dart';
import '../components/ProductRatingInfoContainer.dart';
import '../components/UserReviewContainer.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});
  static String route = "reviews";

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late int product_id;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as ReviewsScreenArguments;

    product_id = args.product_id;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //TODO get these data from page parameters
    String productName = "Boujee";
    String subTitle = "Baker Solid Black Washable Shoulder Bag";

    //TODO get these data from API
    double avgRating = 4.5;
    int numberOfOneStarRating = 1;
    int numberOfTwoStarRating = 2;
    int numberOfThreeStarRating = 3;
    int numberOfFourStarRating = 4;
    int numberOfFiveStarRating = 5;

    List<Review> usersReviews = [
      Review(
          rating_value: 4.5,
          fisrt_name: "Vincent",
          last_name: "Lobo",
          date: "20/03/2021",
          comment: "Totally amazing! I loved the material and the"
              " quality. It has a jolly vibe in it which"
              " makes me feel happy everytime I put it on."),
      Review(
          rating_value: 2,
          fisrt_name: "Vincent2",
          last_name: "Lobo2",
          date: "20/03/2021",
          comment: "Totally amazing! I loved the material and the"
              " quality. It has a jolly vibe in it which"
              " makes me feel happy everytime I put it on."),
      Review(
          rating_value: 2,
          fisrt_name: "Vincent2",
          last_name: "Lobo2",
          date: "20/03/2021",
          comment: "Totally amazing! I loved the material and the"
              " quality. It has a jolly vibe in it which"
              " makes me feel happy everytime I put it on."),
      Review(
          rating_value: 2,
          fisrt_name: "Vincent2",
          last_name: "Lobo2",
          date: "20/03/2021",
          comment: "Totally amazing! I loved the material and the"
              " quality. It has a jolly vibe in it which"
              " makes me feel happy everytime I put it on."),
      Review(
          rating_value: 2,
          fisrt_name: "Vincent2",
          last_name: "Lobo2",
          date: "20/03/2021",
          comment: "Totally amazing! I loved the material and the"
              " quality. It has a jolly vibe in it which"
              " makes me feel happy everytime I put it on.")
    ];

    /***/
    Widget appBarLeadingWidget = IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        leadingWidget: appBarLeadingWidget,
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(
          btn_text: "Write a Review",
          right_btn_img_url: "${KIconsPath}Pluswhite.svg",
          onTap: () {
            Navigator.pushNamed(context, "add-review",
                arguments: AddReviewScreenArguments(product_id: product_id));
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ProductRatingInfoContainer(
                productName: productName,
                subTitle: subTitle,
                avgRating: avgRating,
                numberOfFiveStarRating: numberOfFiveStarRating,
                numberOfFourStarRating: numberOfFourStarRating,
                numberOfThreeStarRating: numberOfThreeStarRating,
                numberOfTwoStarRating: numberOfTwoStarRating,
                numberOfOneStarRating: numberOfOneStarRating),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => UserReviewContainer(
                review: usersReviews[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: usersReviews.length,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    ));
  }
}

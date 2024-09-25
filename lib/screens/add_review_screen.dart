import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../components/BottomSheetOptionButtons.dart';
import '../components/SectionTitle.dart';
import '../components/TitleComponentContainer.dart';

class AddReviewScreen extends StatefulWidget {
  static String route = "add-review";
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController textarea = TextEditingController();

  Widget appBarLeading = Icon(
    Icons.close_outlined,
    size: 40,
    color: KPrimaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        leadingWidget: appBarLeading,
        title: "Add Review",
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(
          btn_text: "Submit Review",
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(children: [
          TitleComponentContainer(
            height: MediaQuery.of(context).size.height * 0.5 * 0.2,
            children: [
              SectionTitle(
                text: "Product Rating",
                showView: false,
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: false,
                maxRating: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star_rounded,
                  color: KOrangeColor,
                  size: 20,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.5,
              children: [
                SectionTitle(
                  text: "Review Description",
                  showView: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    maxLines: 5,
                    controller: textarea,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(KBorderRadius),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: KGreyBackGroundColor,
                    ))
              ]),
        ]),
      ),
    ));
  }
}

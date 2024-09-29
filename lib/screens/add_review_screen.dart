import 'package:ecommerce/Constants/ControllerKeys.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/ScreensArguments.dart';
import '../components/BottomSheetOptionButtons.dart';
import '../components/SectionTitle.dart';
import '../components/TitleComponentContainer.dart';

class AddReviewScreen extends StatefulWidget {
  static String route = "add-review";
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController textarea = TextEditingController();

  late int product_id;
  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as AddReviewScreenArguments;

    product_id = args.product_id;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarLeading = IconButton(
      icon: const Icon(
        Icons.close_outlined,
        size: 40,
        color: KPrimaryColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        leadingWidget: appBarLeading,
        title: "Add Review",
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(
          btn_text: "Submit Review",
          onTap: () {
            if (AddReviewScreenformKey.currentState!.validate()) {
              print("validate");
            }
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(children: [
          TitleComponentContainer(
            height: MediaQuery.of(context).size.height * 0.5 * 0.2,
            children: [
              const SectionTitle(
                title: "Product Rating",
                showView: false,
              ),
              const SizedBox(
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
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
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
          const SizedBox(
            height: 50,
          ),
          TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.5,
              children: [
                const SectionTitle(
                  title: "Review Description",
                  showView: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    maxLines: 5,
                    controller: textarea,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(KBorderRadius),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: KGreyBackGroundColor,
                    ))
              ]),
        ]),
      ),
    ));
  }
}

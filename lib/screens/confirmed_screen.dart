import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';

class ConfirmedScreen extends StatelessWidget {
  static String route = "confirm";
  const ConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const PagesAppBar(
              title: "Order Placed",
              leadingWidget: Icon(
                Icons.close_outlined,
                size: 30,
                color: KPrimaryColor,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset(
                              "${KImagesPath}art.png",
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Cheerio!!",
                                style: TextStyle(
                                    color: KTextDarkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                  textAlign: TextAlign.center,
                                  "The order has been placed. Thanks for shopping with us. You’ll soon recieve the tracking details"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomSheet: BottomSheet(
              onClosing: () {},
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.5 * 0.4,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomSheetOptionButtons(
                      btn_text: "View Order",
                      btn_backgroundColor: KBrightColor,
                      text_color: KPrimaryColor,
                    ),
                    BottomSheetOptionButtons(btn_text: "Continue Shopping"),
                  ],
                ),
              ),
            )));
  }
}

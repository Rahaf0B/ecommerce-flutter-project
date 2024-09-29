import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/screens/PagesContainerWithNavigator.dart';
import 'package:ecommerce/screens/account_login_option_screen_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String route = "welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        "${KImagesPath}Appbg.png",
                        fit: BoxFit.cover,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFFFFFAF4), Color(0x00FFF4E5)],
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: KPageHorizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "The shopping\n destination you need",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: KTextDarkColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AccountLoginOptionScreen.route);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            KPrimaryColor),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                KBorderRadius)))),
                                child: const Text(
                                  "Get Started",
                                  style: TextStyle(color: KBrightColor),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      PagesContainerWithNavigator.route);
                                },
                                child: const Text(
                                  "I already have an account",
                                  style: TextStyle(
                                      color: KTextDarkColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:ecommerce/core/config/pathsManager.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/core/theming/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                            "${PathsManager.imagesPath}Appbg.png",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: ColorsTheme.linearGradientColor,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SpacingManager.pageHorizontalPadding),
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
                                    color: ColorsTheme.blackColor,
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
                                          context, ScreenRoutes.registerScreen);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                        const WidgetStatePropertyAll(
                                            ColorsTheme.primaryColor),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    SpacingManager.borderRadius)))),
                                    child: const Text(
                                      "Get Started",
                                      style:
                                      TextStyle(color: ColorsTheme.whiteColor),
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                child: TextButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context,
                                      //     PagesContainerWithNavigator.route);
                                    },
                                    child: const Text(
                                      "Continue Without Account",
                                      style: TextStyle(
                                          color: ColorsTheme.blackColor,
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
    ;
  }
}

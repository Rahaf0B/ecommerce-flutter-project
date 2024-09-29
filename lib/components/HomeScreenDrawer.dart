import 'package:ecommerce/Constants/Enums.dart';
import 'package:ecommerce/Models/Category.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'TitleArrowNavigator.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer(
      {super.key,
      required this.user_img_url,
      required this.userName,
      required this.topCategoriesElement,
      required this.contactElement,
      this.onTap});

  final String user_img_url;
  final String userName;
  final List<Category> topCategoriesElement;
  final List<Map<int, String>> contactElement;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: KPageHorizontalPadding),
              decoration: BoxDecoration(
                color: KGreyBackGroundColor,
                borderRadius: BorderRadius.circular(KBorderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: KPrimaryColor,
                          radius: 22.0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              user_img_url,
                            ),
                            radius: 20.0,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hello, $userName",
                        style: const TextStyle(
                            fontSize: 16, color: KTextDarkColor),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 20,
                      width: 20,
                      child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pushNamed(context, ProfileScreen.route);
                          },
                          icon:
                              SvgPicture.asset("${KIconsPath}arrowRight.svg")))
                ],
              ),
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: KPageHorizontalPadding),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Categories",
                    style: TextStyle(color: KGreyColor),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TitleArrowNavigator(
                            title: topCategoriesElement[index].name,
                            marginTop: 10,
                            id: topCategoriesElement[index].category_id,
                            onTap: onTap,
                            pageType: PageType.category,
                          ),
                      itemCount: topCategoriesElement.length)
                ],
              ),
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: KPageHorizontalPadding),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Us",
                    style: TextStyle(color: KGreyColor),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TitleArrowNavigator(
                            title: contactElement[index].values.first,
                            marginTop: 10,
                          ),
                      itemCount: contactElement.length),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

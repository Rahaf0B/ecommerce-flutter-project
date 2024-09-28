import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'TitleArrowNavigator.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
    required this.user_img_url,
    required this.userName,
    required this.topCategoriesElement,
    required this.contactElement,
  });

  final String user_img_url;
  final String userName;
  final List<Map<int, String>> topCategoriesElement;
  final List<Map<int, String>> contactElement;

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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hello, ${userName}",
                        style: TextStyle(fontSize: 16, color: KTextDarkColor),
                      )
                    ],
                  ),
                  Container(
                      height: 20,
                      width: 20,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "${KIconsPath}arrowRight.svg")))
                ],
              ),
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 8,
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Categories",
                    style: TextStyle(color: KGreyColor),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TitleArrowNavigator(
                        title: topCategoriesElement[index].values.first,
                        marginTop: 10,
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
              padding:
              EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(color: KGreyColor),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TitleArrowNavigator(
                        title: contactElement[index].values.first,
                        marginTop: 10,
                      ),
                      itemCount: contactElement.length),
                  SizedBox(
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

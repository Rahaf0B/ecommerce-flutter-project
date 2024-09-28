import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/TitleArrowNavigator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String route = "profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> btn_text = [
    "Personal Information",
    "My Orders",
    "My Wishlist",
    "My Reviews",
    "My Address Book",
    "My Saved Cards"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "Profile",
        leadingWidget: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(
          btn_text: "Logout",
          right_btn_img_url: "${KIconsPath}logout.svg",
          text_color: KPrimaryColor,
          btn_backgroundColor: KBrightColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KBorderRadius),
                color: KGreyBackGroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("${KImagesPath}userImg.png"),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tina Vargayee",
                        style: TextStyle(
                            color: KTextDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "tinavar@vinho.com",
                        style: TextStyle(color: KGreyColor),
                      ),
                      Text(
                        "+85-5478564",
                        style: TextStyle(color: KGreyColor),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "${KIconsPath}arrowRight.svg",
                        height: 25,
                        width: 25,
                      ))
                ],
              ),
            ),
            for (String item in btn_text)
              TitleArrowNavigator(title: item,marginTop: 25,)
          ],
        ),
      ),
    ));
  }
}

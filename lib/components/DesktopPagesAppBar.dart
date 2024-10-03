import 'package:ecommerce/Constants/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/Colors.dart';
import '../Constants/HeaderDesktopData.dart';

class DesktopPagesAppBar extends StatelessWidget {
  const DesktopPagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KDesktopAppBarHeight,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "${KIconsPath}logo.svg",
              ),
              SizedBox(
                width: 20,
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: headerElementNames.length,
                itemBuilder: (context, index) => TextButton(
                  onPressed: () {},
                  child: Text(
                    headerElementNames[index],
                    style: TextStyle(color: KPrimaryColor, fontSize: 15),
                  ),
                  style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5 * 0.7,
                child: SearchBar(
                  backgroundColor:
                      WidgetStateProperty.all(KGreyBackGroundColor),
                  hintText: "Search",
                  elevation: const WidgetStatePropertyAll(0),
                  trailing: const [
                    Icon(
                      Icons.search,
                      size: 30,
                    )
                  ],
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(KBorderRadius))),
                  constraints: const BoxConstraints(minHeight: 50),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, WishlistScreen.route);
                },
                icon: SvgPicture.asset(
                  "${KIconsPath}wishlistHeaderIcon.svg",
                  width: 30,
                  fit: BoxFit.cover,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, ProfileScreen.route);
                },
                icon: SvgPicture.asset(
                  "${KIconsPath}ProfileIcon.svg",
                  width: 30,
                  fit: BoxFit.cover,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, CartScreen.route);
                },
                style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent)),
                icon: SvgPicture.asset(
                  "${KIconsPath}bagHeaderIcon.svg",
                  width: 30,
                  fit: BoxFit.cover,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )
            ],
          )
        ],
      ),
    );
  }
}

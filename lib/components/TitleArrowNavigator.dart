import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Constant.dart';


class TitleArrowNavigator extends StatelessWidget {
  const TitleArrowNavigator({
    super.key,
    required this.title,
    required this.marginTop
  });

  final String title;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "${KIconsPath}arrowRight.svg",
                height: 20,
                width: 20,
              ))
        ],
      ),
    );
  }
}

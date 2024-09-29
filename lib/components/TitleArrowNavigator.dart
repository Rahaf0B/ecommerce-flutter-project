import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Constant.dart';
import '../Constants/Enums.dart';


class TitleArrowNavigator extends StatelessWidget {
  const TitleArrowNavigator({
    super.key,
    required this.title,
    required this.marginTop,
    this.onTap,
    this.id,
    this.pageType
  });


  final int ?id;
  final PageType ?pageType;
  final String title;
  final double marginTop;
  final Function ? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
              onPressed: onTap==null ? (){} :() {
                if(id!=null && pageType!=null) {
                  onTap!(pageType: pageType, product_id: id, pageName: title);
                }
else {
                  onTap!();
                }

              },
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

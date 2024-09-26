import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class BannerContent extends StatelessWidget {
  const BannerContent(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.width});
  final String title;
  final String subTitle;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xDEDEDEDE),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        width: MediaQuery.of(context).size.width * (50 / 100) * width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              title,
              style: const TextStyle(
                  color: KPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: KTextFont),
            ),
            Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                subTitle,
                style: const TextStyle(
                    color: KPrimaryColor, fontSize: 12, fontFamily: KTextFont))
          ],
        ),
      ),
    );
  }
}

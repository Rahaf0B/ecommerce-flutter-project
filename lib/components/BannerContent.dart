import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Enums.dart';

class BannerContent extends StatelessWidget {
  const BannerContent(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.width,
      this.direction = Direction.right,
      this.showBackground = true});
  final Widget title;
  final Widget subTitle;
  final double width;
  final bool? showBackground;
  final Direction? direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: direction == Direction.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color:
              showBackground! ? KBannerUpperComponentColor : Colors.transparent,
          borderRadius: direction == Direction.right
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(15), topLeft: Radius.circular(15))
              : const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15)),
        ),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(fit: BoxFit.scaleDown, child: title),
            FittedBox(fit: BoxFit.scaleDown, child: subTitle)
          ],
        ),
      ),
    );
  }
}

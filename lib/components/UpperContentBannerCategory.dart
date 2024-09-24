import 'package:flutter/material.dart';

import '../Constants/Enums.dart';

class UpperContentBannerCategory extends StatelessWidget {
  const UpperContentBannerCategory(
      {Key? key,
      required this.subTitle,
      required this.containerAlignment,
      required this.textIconColor,
      required this.btnColor,
      required this.containerWidth,
      required this.direction,
      this.title})
      : super(key: key);
  final String? title;
  final String subTitle;
  final Color textIconColor;
  final Color btnColor;
  final Alignment containerAlignment;
  final double containerWidth;
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: containerAlignment,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: direction == Direction.left ? 15 : 0,
          right: direction == Direction.right ? 15 : 0),
      child: SizedBox(
        width: containerWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: direction == Direction.left
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            title != null
                ? Text(
                    title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF97451F),
                        fontSize: 10),
                  )
                : Container(),
            SizedBox(height: 2),
            Text(
              subTitle,
              style: TextStyle(
                  color: Color(0xFF97451F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(height: 20),
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: textIconColor,
                  size: 25,
                ),
                color: Color(0xFF97451F),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0x2297451F)),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../Constants/Constant.dart';

class CardBanner extends StatelessWidget {
  const CardBanner(
      {super.key,
      required this.image_url,
      required this.upperComponent,
      this.width,
      this.height});
  final String image_url;
  final Widget upperComponent;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: width == null
              ? MediaQuery.of(context).size.width * (50 / 100) * 1.6
              : width!,
          maxHeight: height == null ? double.infinity : height!),
      child: Card(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KBorderRadius),
        ),
        child: Stack(
          children: [
            Image.asset(
              image_url,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            upperComponent
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class BottomSheetOptionButtons extends StatefulWidget {
  const BottomSheetOptionButtons(
      {super.key,
      required this.left_btn_img_url,
      required this.right_btn_img_url,
      required this.btn_text});
  final String left_btn_img_url;
  final String right_btn_img_url;
  final String btn_text;

  @override
  State<BottomSheetOptionButtons> createState() =>
      _BottomSheetOptionButtonsState();
}

class _BottomSheetOptionButtonsState extends State<BottomSheetOptionButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 80,
      color: KPageBackGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            width: 60,
            decoration: BoxDecoration(
                color: KMiniCardColor,
                borderRadius: BorderRadius.circular(KBorderRadius)),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  widget.left_btn_img_url,
                  width: MediaQuery.of(context).size.width * 0.5 * 0.13,
                )),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.5 * 1.2,
              child: TextButton.icon(
                  iconAlignment: IconAlignment.start,
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(KPrimaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {},
                  label: Text(
                    widget.btn_text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KTextBrightColor),
                  ),
                  icon: SvgPicture.asset(
                    widget.right_btn_img_url,
                  )))
        ],
      ),
    );
  }
}

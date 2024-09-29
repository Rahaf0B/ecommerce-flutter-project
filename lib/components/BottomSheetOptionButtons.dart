import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class BottomSheetOptionButtons extends StatefulWidget {
  const BottomSheetOptionButtons(
      {super.key,
      this.left_btn_img_url,
      this.right_btn_img_url,
      required this.btn_text,
      this.btn_backgroundColor,
      this.text_color,
      this.border_color,
      this.onTap});
  final String? left_btn_img_url;
  final String? right_btn_img_url;
  final String btn_text;
  final Color? btn_backgroundColor;
  final Color? text_color;
  final Color? border_color;
  final VoidCallback? onTap;

  @override
  State<BottomSheetOptionButtons> createState() =>
      _BottomSheetOptionButtonsState();
}

class _BottomSheetOptionButtonsState extends State<BottomSheetOptionButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 80,
      width: double.infinity,
      color: KPageBackGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.left_btn_img_url == null
              ? const SizedBox()
              : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: KMiniCardColor,
                      borderRadius: BorderRadius.circular(KBorderRadius)),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        widget.left_btn_img_url!,
                        width: MediaQuery.of(context).size.width * 0.5 * 0.15,
                      )),
                ),
          widget.left_btn_img_url == null
              ? const SizedBox()
              : const SizedBox(
                  width: 15,
                ),
          Expanded(
            child: Container(
                child: TextButton.icon(
                    iconAlignment: IconAlignment.start,
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        iconSize: WidgetStateProperty.all(
                            widget.right_btn_img_url == null ? 0 : 20),
                        backgroundColor: WidgetStateProperty.all(
                            widget.btn_backgroundColor ?? KPrimaryColor),
                        side: WidgetStatePropertyAll(widget.text_color == null
                            ? BorderSide.none
                            : BorderSide(color: widget.text_color!, width: 2)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(KBorderRadius)))),
                    onPressed: () {
                      widget.onTap!();
                    },
                    label: Text(
                      widget.btn_text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.text_color ?? KBrightColor),
                    ),
                    icon: widget.right_btn_img_url == null
                        ? null
                        : SvgPicture.asset(widget.right_btn_img_url!))),
          )
        ],
      ),
    );
  }
}

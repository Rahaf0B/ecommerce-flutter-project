import 'package:flutter/material.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'ProductSubInfo.dart';

class Productcontainer extends StatefulWidget {
  const Productcontainer(
      {Key? key,
      required this.widthPercentage,
      required this.title,
      required this.subTitle,
      required this.img_url,
      required this.price,
      this.discountValue,
      required this.containerAxis,
      this.onTap})
      : super(key: key);
  final double widthPercentage;
  final String img_url;
  final String title;
  final String subTitle;
  final double price;
  final int? discountValue;
  final Function? onTap;

  final ComponentDirection containerAxis;

  @override
  State<Productcontainer> createState() => _ProductcontainerState();
}

class _ProductcontainerState extends State<Productcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      width: MediaQuery.of(context).size.width * 0.5 * widget.widthPercentage,
      child: Flex(
        direction: widget.containerAxis == ComponentDirection.vertical
            ? Axis.vertical
            : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: GestureDetector(
              onTap: widget.onTap == null
                  ? () {}
                  : () {
                      widget.onTap!();
                    },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  child: Image.asset(
                    widget.img_url,
                  )),
            ),
          ),
          SizedBox(
            width: widget.containerAxis == ComponentDirection.vertical ? 0 : 20,
          ),
          ProductSubInfo(
            elementType: ElementType.card,
            width: widget.widthPercentage - 0.1,
            marginTop: 5,
            title: widget.title,
            subTitle: widget.subTitle,
            price: widget.price,
            discountValue: widget.discountValue,
          )
        ],
      ),
    );
  }
}

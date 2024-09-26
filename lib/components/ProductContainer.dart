import 'package:flutter/material.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Models/Product.dart';
import 'ProductSubInfo.dart';

class Productcontainer extends StatefulWidget {
  const Productcontainer(
      {super.key,
      required this.widthPercentage,
      required this.title,
      required this.subTitle,
      required this.img_url,
      required this.price,
      this.discountValue,
      required this.containerAxis,
      this.onTap,
      this.liked,
      this.product});
  final double widthPercentage;
  final String img_url;
  final String title;
  final String subTitle;
  final double price;
  final double? discountValue;
  final Function(Product)? onTap;
  final bool? liked;
  final ComponentDirection containerAxis;
  //TODO CHANGE THIS
  final Product? product;

  @override
  State<Productcontainer> createState() => _ProductcontainerState();
}

class _ProductcontainerState extends State<Productcontainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      widget.onTap!(widget.product!);
                    },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  child: Image.asset(
                    widget.img_url,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
          SizedBox(
            width: widget.containerAxis == ComponentDirection.vertical ? 0 : 20,
          ),
          ProductSubInfo(
            elementType: ElementType.card,
            marginTop: 5,
            title: widget.title,
            subTitle: widget.subTitle,
            price: widget.price,
            discountValue:
                widget.discountValue,
            liked: widget.liked == null ? false : widget.liked!,
          )
        ],
      ),
    );
  }
}

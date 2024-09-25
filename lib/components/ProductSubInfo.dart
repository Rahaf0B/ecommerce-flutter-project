import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/TextStyle.dart';

class ProductSubInfo extends StatefulWidget {
  const ProductSubInfo(
      {Key? key,
      required this.width,
      required this.marginTop,
      required this.title,
      required this.subTitle,
      required this.price,
      this.discountValue,
      required this.elementType,
      this.subComponent,
      this.liked})
      : super(key: key);

  final ElementType elementType;

  final double width;
  final double marginTop;
  final String title;
  final String subTitle;
  final double price;
  final double? discountValue;
  final Widget? subComponent;
  final bool? liked;
  @override
  State<ProductSubInfo> createState() => _ProductSubInfoState();
}

class _ProductSubInfoState extends State<ProductSubInfo> {
  @override
  Widget build(BuildContext context) {
    Color _favIconColor = widget.liked != null && widget.liked == true
        ? Colors.red
        : Colors.black;

    double priceAfterDiscount = widget.discountValue == null
        ? 0.0
        : (widget.discountValue! * widget.price).roundToDouble();

    double _favIconSize = 20;
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5 * widget.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.title,
                style: widget.elementType == ElementType.page
                    ? productSubInfoTitleStylePage
                    : productSubInfoTitleStyleCard,
              ),
              Text(
                widget.subTitle,
                style: widget.elementType == ElementType.page
                    ? productSubInfoSubTitleStylePage
                    : productSubInfoSubTitleStyleCard,
              ),
              widget.subComponent == null ? SizedBox() : widget.subComponent!,
              Container(
                constraints: BoxConstraints(
                    maxWidth: widget.width != null
                        ? (MediaQuery.of(context).size.width *
                                0.5 *
                                widget.width! -
                            _favIconSize)
                        : double.infinity),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" +
                            (widget.discountValue == null
                                ? widget.price.toString()
                                : priceAfterDiscount.toString()),
                        style: widget.elementType == ElementType.page
                            ? productSubInfoPriceStylePage
                            : productSubInfoPriceStyleCard,
                      ),
                      widget.discountValue == null
                          ? SizedBox()
                          : Text(
                              "\$" + (widget.price).toString(),
                              style: widget.elementType == ElementType.card
                                  ? productSubInfoSubPriceStyleCard
                                  : productSubInfoSubPriceStylePage,
                            ),
                      widget.discountValue == null
                          ? SizedBox()
                          : Text(
                              widget.discountValue!.toString() + "% OFF",
                              style: widget.elementType == ElementType.card
                                  ? productSubInfoDiscountStyleCard
                                  : productSubInfoDiscountStylePage,
                            )
                    ]),
              )
            ]),
          ),
          widget.elementType == ElementType.card
              ? SizedBox(
                  width: _favIconSize,
                  height: _favIconSize,
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        KIconsPath + "wishlist.svg",
                        height: _favIconSize,
                        width: _favIconSize,
                        colorFilter:
                            ColorFilter.mode(_favIconColor, BlendMode.srcIn),
                      )),
                )
              : SizedBox(
                  // width: 0,
                  )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/TextStyle.dart';

class ProductSubInfo extends StatefulWidget {
  const ProductSubInfo(
      {super.key,
      required this.width,
      required this.marginTop,
      required this.title,
      required this.subTitle,
      required this.price,
      this.discountValue,
      required this.elementType,
      this.subComponent,
      this.liked});

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
    Color favIconColor = widget.liked != null && widget.liked == true
        ? Colors.red
        : Colors.black;

    double priceAfterDiscount = widget.discountValue == null
        ? 0.0
        : (widget.discountValue! * widget.price).roundToDouble();

    double favIconSize = 20;
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
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
              widget.subComponent == null ? const SizedBox() : widget.subComponent!,
              Container(
                constraints: BoxConstraints(
                    maxWidth: widget.width != null
                        ? (MediaQuery.of(context).size.width *
                                0.5 *
                                widget.width -
                            favIconSize)
                        : double.infinity),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.discountValue == null
                                ? widget.price.toString()
                                : priceAfterDiscount.toString()}",
                        style: widget.elementType == ElementType.page
                            ? productSubInfoPriceStylePage
                            : productSubInfoPriceStyleCard,
                      ),
                      widget.discountValue == null
                          ? const SizedBox()
                          : Text(
                              "\$${widget.price}",
                              style: widget.elementType == ElementType.card
                                  ? productSubInfoSubPriceStyleCard
                                  : productSubInfoSubPriceStylePage,
                            ),
                      widget.discountValue == null
                          ? const SizedBox()
                          : Text(
                              "${widget.discountValue!}% OFF",
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
                  width: favIconSize,
                  height: favIconSize,
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "${KIconsPath}wishlist.svg",
                        height: favIconSize,
                        width: favIconSize,
                        colorFilter:
                            ColorFilter.mode(favIconColor, BlendMode.srcIn),
                      )),
                )
              : const SizedBox(
                  // width: 0,
                  )
        ],
      ),
    );
  }
}

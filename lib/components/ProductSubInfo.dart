import 'package:ecommerce/components/CollectionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/TextStyle.dart';
import 'Devices.dart';

class ProductSubInfo extends StatefulWidget {
  const ProductSubInfo(
      {super.key,
      required this.marginTop,
      required this.title,
      required this.subTitle,
      required this.price,
      this.discountValue,
      required this.elementType,
      this.subComponent,
      this.liked});

  final ElementType elementType;
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

    double favIconSize = Devices.IsDesktop(context) ? 6.w : 20.w;
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.title,
                    style: widget.elementType == ElementType.page
                        ? productSubInfoTitleStylePage.copyWith(
                            fontSize: Devices.IsDesktop(context) ? 4.sp : 20.sp)
                        : productSubInfoTitleStyleCard.copyWith(
                            fontSize:
                                Devices.IsDesktop(context) ? 4.sp : 12.sp),
                  )),
              Devices(
                  mobile: SizedBox(),
                  desktop: SizedBox(
                    height: 10,
                  )),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.subTitle,
                    style: widget.elementType == ElementType.page
                        ? productSubInfoSubTitleStylePage.copyWith(
                            fontSize: Devices.IsDesktop(context) ? 4.sp : 20.sp)
                        : productSubInfoSubTitleStyleCard.copyWith(
                            fontSize:
                                Devices.IsDesktop(context) ? 4.sp : 12.sp),
                  )),
              Devices(
                  mobile: SizedBox(),
                  desktop: SizedBox(
                    height: 10,
                  )),
              widget.subComponent == null
                  ? const SizedBox()
                  : Column(children: [
                      widget.subComponent!,
                      Devices(
                          mobile: SizedBox(),
                          desktop: SizedBox(
                            height: 10.h,
                          )),
                    ]),
              Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "\$${widget.discountValue == null ? widget.price.toString() : priceAfterDiscount.toString()}",
                            style: widget.elementType == ElementType.page
                                ? productSubInfoPriceStylePage.copyWith(
                                    fontSize: Devices.IsDesktop(context)
                                        ? 4.sp
                                        : 20.sp)
                                : productSubInfoPriceStyleCard.copyWith(
                                    fontSize: Devices.IsDesktop(context)
                                        ? 4.sp
                                        : 12.sp),
                          )),
                      widget.discountValue == null
                          ? const SizedBox()
                          : const SizedBox(
                              width: 10,
                            ),
                      widget.discountValue == null
                          ? const SizedBox()
                          : FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("\$${widget.price}",
                                  style: widget.elementType == ElementType.card
                                      ? productSubInfoSubPriceStyleCard
                                      : productSubInfoSubPriceStylePage)),
                      widget.discountValue == null
                          ? const SizedBox()
                          : const SizedBox(
                              width: 10,
                            ),
                      widget.discountValue == null
                          ? const SizedBox()
                          : FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("${widget.discountValue!}% OFF",
                                  style: widget.elementType == ElementType.card
                                      ? productSubInfoDiscountStyleCard
                                      : productSubInfoDiscountStylePage))
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

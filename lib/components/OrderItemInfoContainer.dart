import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import 'ProductSubInfo.dart';

class OrderItemInfoContainer extends StatefulWidget {
  const OrderItemInfoContainer(
      {super.key,
      required this.img_url,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.quantity});
  final String img_url;
  final String title;
  final String subTitle;
  final double price;
  final int quantity;
  @override
  State<OrderItemInfoContainer> createState() => _OrderItemInfoContainerState();
}

class _OrderItemInfoContainerState extends State<OrderItemInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5 * 0.6,
        height: MediaQuery.of(context).size.height * 0.5 * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(KBorderRadius),
          child: Image.asset(
            widget.img_url,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSubInfo(
              elementType: ElementType.rowComponent,
              marginTop: 5,
              title: widget.title,
              subTitle: widget.subTitle,
              price: widget.price,
              subComponent: Text(
                "Qty- ${widget.quantity}",
                style: const TextStyle(color: KGreyColor),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsetsDirectional.symmetric(horizontal: 40)),
                  backgroundColor:
                      const WidgetStatePropertyAll(KPageBackGroundColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      side: const BorderSide(color: KPrimaryColor),
                      borderRadius: BorderRadius.circular(KBorderRadius)))),
              child: const Text(
                "Add to bag",
                style: TextStyle(color: KPrimaryColor),
              ),
            )
          ],
        ),
      )
    ]);
  }
}

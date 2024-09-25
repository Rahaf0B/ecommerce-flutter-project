import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
    required this.subTotalValue,
    required this.discountValue,
    required this.deliveryFeeValue,
  });

  final double subTotalValue;
  final double discountValue;
  final double deliveryFeeValue;

  @override
  Widget build(BuildContext context) {
    double grandTotalValue =
        (subTotalValue - discountValue - deliveryFeeValue).roundToDouble();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Details"),
          SizedBox(
            height: 10,
          ),
          ListTileComponent(
            title: "Sub Total",
            value: "\$" + subTotalValue.toString(),
          ),
          SizedBox(
            height: 10,
          ),
          ListTileComponent(
            title: "Discount",
            value: "-\$" + discountValue.toString(),
          ),
          SizedBox(
            height: 10,
          ),
          ListTileComponent(
            title: "Delivery Fee",
            value: "-\$" + deliveryFeeValue.toString(),
          ),
          SizedBox(
            height: 10,
          ),
          ListTileComponent(
            title: "Grand Total",
            value: "\$" + grandTotalValue.toString(),
            mainTitle: true,
          )
        ],
      ),
    );
  }
}

class ListTileComponent extends StatelessWidget {
  const ListTileComponent(
      {super.key, required this.title, required this.value, this.mainTitle});
  final String title;
  final String value;
  final bool? mainTitle;
  @override
  Widget build(BuildContext context) {
    var titleFontWeight = mainTitle == null ? FontWeight.w500 : FontWeight.bold;
    var titleColor = mainTitle == null ? KGreyColor : KTextDarkColor;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 15, color: titleColor, fontWeight: titleFontWeight),
      ),
      Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      )
    ]);
  }
}

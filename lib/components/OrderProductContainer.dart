import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/TextStyle.dart';

class OrderProductContainer extends StatelessWidget {
  const OrderProductContainer({
    super.key,
    required this.img_url,
    required this.date,
    required this.title,
    required this.subtitle,
  });
  final String img_url;
  final String date;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(KBorderRadius),
                child: Image.asset(
                  img_url,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: productSubInfoTitleStyleCard.copyWith(
                    fontWeight: FontWeight.normal),
              ),
              Text(
                title,
                style:
                    productSubInfoSubTitleStyleCard.copyWith(color: KGreyColor),
              ),
              Text(
                subtitle,
                style:
                    productSubInfoSubTitleStyleCard.copyWith(color: KGreyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/components/CardBanner.dart';
import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  const SliderView(
      {Key? key,
      required this.number_of_items,
      required this.children,
      required this.height})
      : super(key: key);
  final int number_of_items;
  final List<Widget> children;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: ListView.separated(
            separatorBuilder: (context, i) {
              return SizedBox(
                width: 15,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: number_of_items,
            itemBuilder: (context, i) {
              return children[i];
            }));
  }
}

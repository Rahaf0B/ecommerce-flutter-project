import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  const SliderView(
      {super.key,
      required this.number_of_items,
      required this.children,
      required this.height});
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
              return const SizedBox(
                width: 15,
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: number_of_items,
            itemBuilder: (context, i) {
              return children[i];
            }));
  }
}

import 'package:flutter/material.dart';

class TitleComponentContainer extends StatelessWidget {
  const TitleComponentContainer(
      {super.key, required this.children, this.height});
  final double? height;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

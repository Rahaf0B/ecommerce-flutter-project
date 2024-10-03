import 'package:flutter/material.dart';

import 'Devices.dart';

class SliderView extends StatelessWidget {
  const SliderView({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (var child in children) ...[
            child,
            SizedBox(
              width: Devices.IsMobile(context) ? 15 : 35,
            )
          ],
        ])
    );
  }
}

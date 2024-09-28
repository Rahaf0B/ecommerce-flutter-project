import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class ChangeQuantity extends StatefulWidget {
  const ChangeQuantity(
      {super.key,
      required this.quantity,
     });
  final int quantity;

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    int productQuantity = widget.quantity;
    double btnSize = 25;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: btnSize,
            child: IconButton(
              style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                Size.zero,
              )),
              constraints: BoxConstraints(minWidth: btnSize, maxWidth: btnSize),
              onPressed: () {
                setState(() {
                  productQuantity += 1;
                  print(productQuantity);
                });
              },
              icon: const Icon(
                Icons.add,
              ),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KBorderRadius),
                color: KGreyBackGroundColor),
            padding: const EdgeInsets.all(10),
            child: Text(productQuantity.toString()),
          ),
          SizedBox(
              width: btnSize,
              child: IconButton(
                constraints:
                    BoxConstraints(minWidth: btnSize, maxWidth: btnSize),
                onPressed: () {
                  setState(() {
                    if (productQuantity > 1) productQuantity -= 1;
                  });
                },
                icon: const Icon(Icons.minimize_outlined),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
              )),
        ],
      ),
    );
  }
}

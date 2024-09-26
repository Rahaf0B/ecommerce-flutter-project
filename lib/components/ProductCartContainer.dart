import "package:flutter/material.dart";

import "../Constants/Colors.dart";
import "../Constants/Constant.dart";
import "../Constants/Enums.dart";
import "ProductSubInfo.dart";

class ProductCartContainer extends StatefulWidget {
  const ProductCartContainer(
      {super.key,
      required this.img_url,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.quantity,
      this.discountValue});

  final String img_url;
  final String title;
  final String subtitle;
  final double price;
  final double? discountValue;
  final int quantity;

  @override
  State<ProductCartContainer> createState() => _ProductCartContainerState();
}

class _ProductCartContainerState extends State<ProductCartContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KBorderRadius),
        color: KPageBackGroundColor,
      ),
      child: SizedBox(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              ProductSubInfo(
                elementType: ElementType.cart,
                width: 1,
                marginTop: 5,
                title: widget.title,
                subTitle: widget.subtitle,
                price: widget.price,
                discountValue: widget.discountValue,
                subComponent: Selector(quantity: widget.quantity),
              )
            ]),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: KGreyColor,
              thickness: 0.6,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                        alignment: Alignment.center),
                    child: const Text(
                      "Move to Wishlist",
                      style: TextStyle(fontSize: 18, color: KPrimaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    color: KGreyColor,
                    thickness: 0.6,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
                        alignment: Alignment.center),
                    child: const Text(
                      "Remove",
                      style: TextStyle(fontSize: 18, color: KPrimaryColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Selector extends StatefulWidget {
  const Selector({super.key, required this.quantity});
  final int quantity;

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
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
              constraints:
                  BoxConstraints(minWidth: btnSize, maxWidth: btnSize),
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

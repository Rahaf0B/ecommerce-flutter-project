import "package:flutter/material.dart";

import "../Constants/Colors.dart";
import "../Constants/Constant.dart";
import "../Constants/Enums.dart";
import "ProductSubInfo.dart";

class ProductCartContainer extends StatefulWidget {
  const ProductCartContainer(
      {Key? key,
      required this.img_url,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.quantity,
      this.discountValue})
      : super(key: key);

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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KBorderRadius),
        color: KPageBackGroundColor,
      ),
      child: SizedBox(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
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
              SizedBox(
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
            SizedBox(
              height: 5,
            ),
            Divider(
              color: KGreyColor,
              thickness: 0.6,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Move to Wishlist",
                      style: TextStyle(fontSize: 18, color: KPrimaryColor),
                    ),
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                        alignment: Alignment.center),
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    color: KGreyColor,
                    thickness: 0.6,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Remove",
                      style: TextStyle(fontSize: 18, color: KPrimaryColor),
                    ),
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                        alignment: Alignment.center),
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
  const Selector({Key? key, required this.quantity}) : super(key: key);
  final int quantity;

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  @override
  Widget build(BuildContext context) {
    int _productQuantity = widget.quantity;
    double _btn_size = 25;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: _btn_size,
            child: IconButton(
              style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                Size.zero,
              )),
              constraints:
                  BoxConstraints(minWidth: _btn_size, maxWidth: _btn_size),
              onPressed: () {
                setState(() {
                  _productQuantity += 1;
                  print(_productQuantity);
                });
              },
              icon: Icon(
                Icons.add,
              ),
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KBorderRadius),
                color: KGreyBackGroundColor),
            padding: EdgeInsets.all(10),
            child: Text(_productQuantity.toString()),
          ),
          Container(
              width: _btn_size,
              child: IconButton(
                constraints:
                    BoxConstraints(minWidth: _btn_size, maxWidth: _btn_size),
                onPressed: () {
                  setState(() {
                    if (_productQuantity > 1) _productQuantity -= 1;
                  });
                },
                icon: Icon(Icons.minimize_outlined),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
              )),
        ],
      ),
    );
  }
}

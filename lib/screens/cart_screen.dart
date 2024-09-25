import 'package:ecommerce/Models/Cart.dart';
import 'package:ecommerce/Models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Models/Figure.dart';
import '../components/OrderDetailsContainer.dart';
import '../components/ProductCartContainer.dart';
import '../components/ProductSubInfo.dart';

class CartScreen extends StatefulWidget {
  static String route = "cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> productItems = [];
  List<Product> _productsData = [];
  double subTotalValue = 0.0;
  double discountValue = 0.0;
  double deliveryFeeValue = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subTotalValue = 119.69;
    discountValue = 13.40;
    deliveryFeeValue = 0.0;
    _productsData = [
      Product(
        product_id: 1,
        name: 'Grande',
        sub_title: "Blossom Pouch",
        price: 39.45,
        description:
            "Experience comfortable and easy travelling like never before with this coach bag. It features a zip closure, removable straps and multiple organization compartments to keep your valuables safe. Crafted from premium material, it is durable and lasts long.",
        discount_value: 20,
        quantity: 10,
        category_id: 1,
        brand_id: 2,
        is_liked: true,
        number_of_ratings: 20,
        ratings: 4.2,
        images: [
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: true),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false)
        ],
      ),
      Product(
        product_id: 1,
        name: 'Grande',
        sub_title: "Blossom Pouch",
        price: 39.45,
        description:
            "Experience comfortable and easy travelling like never before with this coach bag. It features a zip closure, removable straps and multiple organization compartments to keep your valuables safe. Crafted from premium material, it is durable and lasts long.",
        discount_value: 20,
        quantity: 10,
        category_id: 1,
        brand_id: 2,
        is_liked: false,
        number_of_ratings: 20,
        ratings: 4.2,
        images: [
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: true),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false)
        ],
      ),
      Product(
        product_id: 1,
        name: 'Grande',
        sub_title: "Blossom Pouch",
        price: 39.45,
        description:
            "Experience comfortable and easy travelling like never before with this coach bag. It features a zip closure, removable straps and multiple organization compartments to keep your valuables safe. Crafted from premium material, it is durable and lasts long.",
        discount_value: 20,
        quantity: 10,
        category_id: 1,
        brand_id: 2,
        is_liked: false,
        number_of_ratings: 20,
        ratings: 4.2,
        images: [
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: true),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false),
          Figure(image_id: 1, url: KImagesPath + "bag1.png", type: false)
        ],
      ),
    ];
    for (Product item in _productsData) {
      productItems.add(
        Cart(product: item, quantity: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomSheet: CartBottomSheet(
        totalBagAmount: 106.29,
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Icon(
          Icons.close_outlined,
          size: 30,
        ),
        title: Text(
          "My Bag",
          style: TextStyle(color: KPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(children: [
          ClipPath(
              clipper: MultipleRoundedCurveClipper(),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 70),
                color: KGreyBackGroundColor,
                child: Container(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ProductCartContainer(
                      quantity: productItems[index].quantity,
                      title: productItems[index].product.name,
                      discountValue: productItems[index].product.discount_value,
                      img_url: productItems[index]
                          .product
                          .images
                          .firstWhere((img) => img.type == true)
                          .url,
                      price: productItems[index].product.price,
                      subtitle: productItems[index].product.sub_title,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: productItems.length,
                  ),
                ),
              )),
          OrderDetailsContainer(
            subTotalValue: subTotalValue,
            discountValue: discountValue,
            deliveryFeeValue: deliveryFeeValue,
          ),
          SizedBox(
            height: 15,
          )
        ]),
      ),
    ));
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, required this.totalBagAmount});
  final double totalBagAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5 * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Bag Amount",
                  style: TextStyle(
                      color: KGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$" + totalBagAmount.toString(),
                  style: TextStyle(
                      color: KTextDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5 * 0.1,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(KPrimaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(KBorderRadius)))),
                  onPressed: () {},
                  child: Text(
                    "Place Order",
                    style: TextStyle(color: KTextBrightColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:ecommerce/Constants/Enums.dart';
import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/Models/Cart.dart';
import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:ecommerce/screens/order_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Models/Figure.dart';
import '../components/OrderDetailsContainer.dart';
import '../components/ProductCartContainer.dart';

class CartScreen extends StatefulWidget {
  static String route = "cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> productItems = [];
  List<Product> _productsData = [];
  double subTotalValue = 0.0;
  double discountValue = 0.0;
  double deliveryFeeValue = 0.0;

  late PreviousNavigatorType previousNavigatorType;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments;
print(args);
    if (args != null) {
      var argument = args as CartScreenArguments;
      previousNavigatorType = argument.previousNavigatorType;
    } else {
      previousNavigatorType = PreviousNavigatorType.tap;
    }

    super.didChangeDependencies();
  }

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
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: true),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false)
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
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: true),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false)
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
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: true),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false)
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
    Widget appBarLeadingWidget = IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return SafeArea(
        child: Scaffold(
      bottomSheet: const CartBottomSheet(
        //Todo Change This
        order_id: 1,
        totalBagAmount: 106.29,
      ),
      appBar: PagesAppBar(
        leadingWidget: previousNavigatorType == PreviousNavigatorType.navigator
            ? appBarLeadingWidget
            : SizedBox(width: 0,),
        title: "My Bag",
      ),
      body: Container(
        child: ListView(children: [
          ClipPath(
              clipper: MultipleRoundedCurveClipper(),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 70),
                color: KGreyBackGroundColor,
                child: Container(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
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
                    separatorBuilder: (context, index) => const SizedBox(
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
          const SizedBox(
            height: 15,
          )
        ]),
      ),
    ));
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
    required this.totalBagAmount,
    required this.order_id,
  });
  final double totalBagAmount;

  //TODO Change this
  final int order_id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5 * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Bag Amount",
                  style: TextStyle(
                      color: KGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$$totalBagAmount",
                  style: const TextStyle(
                      color: KTextDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 * 0.1,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(KPrimaryColor),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(KBorderRadius)))),
                  onPressed: () {
                    Navigator.pushNamed(context, OrderSummaryScreen.route,
                        arguments:
                            OrderSummaryScreenArguments(order_id: order_id));
                  },
                  child: const Text(
                    "Place Order",
                    style: TextStyle(color: KBrightColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

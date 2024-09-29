import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Models/Cart.dart';
import '../Models/Figure.dart';
import '../Models/Product.dart';
import '../components/OrderItemInfoContainer.dart';

class ItemsOrderedScreen extends StatefulWidget {
  static String route = "order-items";
  const ItemsOrderedScreen({super.key});

  @override
  State<ItemsOrderedScreen> createState() => _ItemsOrderedScreenState();
}

class _ItemsOrderedScreenState extends State<ItemsOrderedScreen> {
  String orderNumber = "874522648";
  String orderDate = "September 5, 2020";
  int numberOfProducts = 2;
  final List<Cart> _productItems = [];
  List<Product> _productsData = [];

  late int order_id;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments
        as ItemOrderedScreenArguments;

    order_id = args.order_id;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      _productItems.add(
        Cart(product: item, quantity: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "Items Ordered",
        leadingWidget: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: KPrimaryColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: KGreyBackGroundColor,
                borderRadius: BorderRadius.circular(KBorderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order #$orderNumber",
                        style: const TextStyle(
                            color: KTextDarkColor, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Placed On",
                        style: TextStyle(color: KGreyColor, fontSize: 15),
                      ),
                      Text(
                        orderDate,
                        style: const TextStyle(
                            color: KTextDarkColor, fontSize: 16),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsetsDirectional.symmetric(
                                horizontal: 15, vertical: 10)),
                        backgroundColor:
                            const WidgetStatePropertyAll(KPrimaryColor),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(KBorderRadius)))),
                    child: const Text(
                      "Completed",
                      style: TextStyle(color: KBrightColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "$numberOfProducts Product(s)",
                      style: const TextStyle(color: KGreyColor),
                    ),
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => OrderItemInfoContainer(
                            img_url: _productItems[index]
                                .product
                                .images
                                .firstOrNull!
                                .url,
                            title: _productItems[index].product.name,
                            subTitle: _productItems[index].product.sub_title,
                            price: _productItems[index].product.price,
                            quantity: _productItems[index].quantity,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: _productItems.length)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

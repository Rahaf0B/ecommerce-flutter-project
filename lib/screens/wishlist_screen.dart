import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Models/Figure.dart';
import '../Models/Product.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/GridViewCreator.dart';
import '../components/ProductContainer.dart';

class WishlistScreen extends StatefulWidget {
  static String route = "wishlist";
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late List<Product> _productsData;
  int productCount = 255;
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
        is_liked: true,
        number_of_ratings: 20,
        ratings: 4.2,
        images: [
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: true),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false),
          Figure(image_id: 1, url: "${KImagesPath}bag1.png", type: false)
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarLeadingWidget = IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    void productItemOnTap(Product product) {
      showModalBottomSheet(
          backgroundColor: KPageBackGroundColor,
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => SingleChildScrollView(
                  child: BottomSheetProductSubInfoComponent(
                product_id: product.product_id,
                title: product.name,
                img_url:
                    product.images.firstWhere((img) => img.type == true).url,
                price: product.price,
                subTitle: product.sub_title,
                rating: product.ratings,
                numberOfReviews: product.number_of_ratings,
              )));
    }

    return SafeArea(
        child: Scaffold(
            appBar: PagesAppBar(
              title: "My Wishlist",
              leadingWidget: appBarLeadingWidget,
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KPageHorizontalPadding,
                ),
                child: ListView(children: [
                  Text(
                    "$productCount Products",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: KGreyColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Gridviewcreator(
                      numberOfColumns: 2,
                      numberOfRows: (_productsData.length / 2).round(),
                      children: [
                        for (Product item in _productsData) ...[
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Productcontainer(
                                  widthPercentage: 1,
                                  title: item.name,
                                  containerAxis: ComponentDirection.vertical,
                                  subTitle: item.sub_title,
                                  img_url: item.images
                                      .firstWhere((img) => img.type == true)
                                      .url,
                                  liked: item.is_liked,
                                  price: item.price,
                                  discountValue: item.discount_value == null
                                      ? 0.0
                                      : item.discount_value!,
                                  onTap: (Product item) =>
                                      productItemOnTap(item),
                                  product: item,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextButton.icon(
                                    style: ButtonStyle(
                                        shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        KBorderRadius))),
                                        side: const WidgetStatePropertyAll(
                                            BorderSide(color: KPrimaryColor))),
                                    icon: SvgPicture.asset(
                                      "${KIconsPath}bagHeaderIcon.svg",
                                      colorFilter: const ColorFilter.mode(
                                          KPrimaryColor, BlendMode.srcIn),
                                    ),
                                    onPressed: () {},
                                    label: const Text(
                                      "Add to bag",
                                      style: TextStyle(
                                          color: KPrimaryColor,
                                          fontWeight: FontWeight.w500),
                                    )),
                              )
                            ],
                          )
                        ]
                      ])
                ]))));
  }
}

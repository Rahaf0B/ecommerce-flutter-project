import 'package:ecommerce/components/GridViewCreator.dart';
import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Models/Figure.dart';
import '../Models/Product.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/ProductContainer.dart';
import '../components/RecentSearch.dart';
import '../components/SearchBarComponent.dart';
import '../components/SectionTitle.dart';
import '../components/SliderView.dart';
import '../components/TitleComponentContainer.dart';

class SearchScreen extends StatefulWidget {
  static String route = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Widget> recentSerachValue = [];
  late List<Productcontainer> productsData;

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
              img_url: product.images.firstWhere((img) => img.type == true).url,
              price: product.price,
              subTitle: product.sub_title,
              rating: product.ratings,
              numberOfReviews: product.number_of_ratings,
            )));
  }

  late List<Product> _productsData;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    recentSerachValue = [
      const RecentSearch(
        text: "Womens Wrist Watches",
      ),
      const RecentSearch(
        text: "Womens Wrist Watches",
      ),
      const RecentSearch(
        text: "Womens Wrist Watches",
      )
    ];
    _productsData = [
      Product(
        product_id: 1,
        name: 'Grande22',
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding)
            .copyWith(top: 15),
        child: ListView(
          children: [
            TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.4,
              children: [
                const SectionTitle(
                  title: "Recent Searchs",
                  showView: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Gridviewcreator(
                    numberOfColumns: 2,
                    numberOfRows: (recentSerachValue.length / 2).round(),
                    children: recentSerachValue),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.7,
              children: [
                const SectionTitle(
                  title: "New Arrivals",
                  showView: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                SliderView(
                  children: _productsData == null
                      ? []
                      : [
                          for (Product item in _productsData)
                            Productcontainer(
                              widthPercentage: 0.7,
                              title: item.name,
                              containerAxis: ComponentDirection.vertical,
                              subTitle: item.sub_title,
                              img_url: item.images
                                  .firstWhere((img) => img.type == true)
                                  .url,
                              price: item.price,
                              onTap: (Product item) => productItemOnTap(item),
                              liked: item.is_liked,
                              product: item,
                            )
                        ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/ScreensArguments.dart';
import '../Models/Figure.dart';
import '../components/AvgRatingComponent.dart';
import '../components/BottomSheetOptionButtons.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/CollapsibleComponent.dart';
import '../components/ProductContainer.dart';
import '../components/ProductSubInfo.dart';
import '../components/SectionTitle.dart';
import '../components/SliderView.dart';
import '../components/TitleComponentContainer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  static const route = "product";
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> _productsData;
  void productItemOnTap(Product product) {
    showModalBottomSheet(
        backgroundColor: KPageBackGroundColor,
        context: context,
        isScrollControlled: true,
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

  late Product _productInfo;

  late int product_id;
  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductScreenArguments;

    product_id = args.product_id;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //TODO GET THIS FROM API
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

    _productInfo = Product(
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
        Figure(
            image_id: 1, url: "${KImagesPath}bag-thumbnail.png", type: false),
        Figure(image_id: 1, url: "${KImagesPath}bag-thumbnail.png", type: false)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Widget leadAppBarWidget = IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: KPrimaryColor,
      ),
    );
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(leadingWidget: leadAppBarWidget),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: const BottomSheetOptionButtons(
          btn_text: "Add to Bag",
          right_btn_img_url: "${KIconsPath}bagIconOutline.svg",
          left_btn_img_url: "${KIconsPath}wishlist.svg",
        ),
      ),
      body: Container(
        child: ListView(
          controller: scrollController,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: KPageHorizontalPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: SliderView(
                          number_of_items: _productInfo.images.length,
                          height: MediaQuery.of(context).size.height *
                              (50 / 100) *
                              0.9,
                          children: _productInfo == null
                              ? []
                              : [
                                  for (var item in _productInfo.images)
                                    ProductImgContainer(
                                      img_url: item.url,
                                    ),
                                ],
                        ),
                      ),
                      ProductSubInfo(
                          // width: 1,
                          elementType: ElementType.page,
                          title: _productInfo == null ? "" : _productInfo.name,
                          subTitle: _productInfo == null
                              ? ""
                              : _productInfo.sub_title,
                          marginTop: 10,
                          price:
                              _productInfo == null ? 0.0 : _productInfo.price,
                          discountValue: _productInfo == null
                              ? 0.0
                              : _productInfo.discount_value),
                      const SizedBox(
                        height: 15,
                      ),
                      AvgRatingComponent(
                        product_id: _productInfo.product_id,
                        show_icon: false,
                        rating: 4.5,
                        numberOfReviews: 24,
                      ),
                    ])),
            const SizedBox(height: 20),
            Container(
                child: Column(children: [
              const Divider(
                color: KGreyBackGroundColor,
                thickness: 10,
              ),
              CollapsibleComponent(
                  title: "Product Description",
                  scrollController: scrollController,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: KPageHorizontalPadding),
                      child: Text(
                          style: const TextStyle(color: KGreyColor),
                          _productInfo == null
                              ? ""
                              : _productInfo.description))),
            ])),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: KPageHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      "Ratings & Reviews",
                      style: TextStyle(
                          color: KTextDarkColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "reviews",
                          arguments:
                              ReviewsScreenArguments(product_id: product_id));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: SvgPicture.asset("${KIconsPath}arrowRight.svg"),
                  )
                ],
              ),
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: KPageHorizontalPadding),
              margin: const EdgeInsets.only(bottom: 70),
              child: TitleComponentContainer(
                height: MediaQuery.of(context).size.height * 0.5 * 0.65,
                children: [
                  const SectionTitle(
                    title: "You Might Also Like",
                    showView: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SliderView(
                    number_of_items:
                        _productsData == null ? 0 : _productsData.length,
                    height: MediaQuery.of(context).size.height * 0.5 * 0.7 - 60,
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
            )
          ],
        ),
      ),
    ));
  }
}

class ProductImgContainer extends StatelessWidget {
  const ProductImgContainer({super.key, required this.img_url});
  final String img_url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - (KPageHorizontalPadding * 2),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(KBorderRadius),
          child: Image.asset(
            fit: BoxFit.cover,
            img_url,
          )),
    );
  }
}

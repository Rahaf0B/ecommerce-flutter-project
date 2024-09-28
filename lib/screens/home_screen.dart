import 'package:ecommerce/Models/Brand.dart';
import 'package:ecommerce/Models/Category.dart';
import 'package:ecommerce/Models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Models/Figure.dart';
import '../components/BannerContent.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/CardBanner.dart';
import '../components/CardCategoryBrand.dart';
import '../components/CollapsibleComponent.dart';
import '../components/FooterComponentElement.dart';
import '../components/GridViewCreator.dart';
import '../components/Handpicked.dart';
import '../components/PagesAppBar.dart';
import '../components/ProductContainer.dart';
import '../components/SectionCardBannerCategory.dart';
import '../components/SectionTitle.dart';
import '../components/SliderView.dart';
import '../components/TitleComponentContainer.dart';

class HomeScreen extends StatefulWidget {
  static String route="home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  void productItemOnTap(Product product) {
    showModalBottomSheet(
        backgroundColor: KPageBackGroundColor,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
                child: BottomSheetProductSubInfoComponent(
              title: product.name,
              img_url: product.images.firstWhere((img) => img.type == true).url,
              price: product.price,
              subTitle: product.sub_title,
              rating: product.ratings,
              numberOfReviews: product.number_of_ratings,
            )));
  }

  late List<CardBanner> _cardBannerData;
  late List<Product> _productsData;
  late List<Brand> _cardBrandData;
  late List<Category> _cardCategoryData;

  @override
  void initState() {
    // TODO: implement initState

    _cardBannerData = [
      const CardBanner(
        // height: 150,
        image_url: "${KImagesPath}shoulderGirl.png",
        upperComponent: BannerContent(
            width: 0.93,
            title: "Carry your Funk",
            subTitle: "Trendy handbags collection for your party animal"),
      ),
      const CardBanner(

          // height: 150,
          image_url: "${KImagesPath}shoulderGirl.png",
          upperComponent: BannerContent(
              width: 0.93,
              title: "Carry your Funk",
              subTitle: "Trendy handbags collection for your party animal"))
    ];
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
    _cardBrandData = [
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara"),
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara"),
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara"),
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara"),
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara"),
      Brand(
          brand_id: 1,
          image: Figure(image_id: 1, url: "${KIconsPath}Zara_Logo.svg"),
          name: "Zara")
    ];
    _cardCategoryData = [
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 1),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 1),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 1),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 1),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 1),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 1),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 1),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleDrawer() {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.closeDrawer();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }

    Widget appBarLeadingWidget = IconButton(
      onPressed: () {
        toggleDrawer();
      },
      icon: SvgPicture.asset(
        "${KIconsPath}leading-icon.svg",
        fit: BoxFit.cover,
        width: 40,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );

    List<Widget> appBarActions = [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "${KIconsPath}search.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "${KIconsPath}ProfileIcon.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: PagesAppBar(
        title: "Home",
        actionsWidgets: appBarActions,
        leadingWidget: appBarLeadingWidget,
      ),
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SliderView(
                        number_of_items: 2,
                        height: MediaQuery.of(context).size.height *
                            (50 / 100) *
                            0.4,
                        children: _cardBannerData,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.35,
                        children: [
                          const SectionTitle(
                            text: 'Top Categories',
                            showView: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SliderView(
                            number_of_items: _cardCategoryData.length,
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.4 -
                                    70,
                            children: [
                              for (var item in _cardCategoryData)
                                CardCategoryBrand(
                                  img_url: item.image.url,
                                  text: item.name,
                                  id: item.category_id,
                                  containerHeight: KMiniCardCategoryHeight,
                                  containerWidth: KMiniCardCategoryWidth,
                                ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.7,
                        children: [
                          const SectionTitle(
                            text: "New Arrivals",
                            showView: true,
                          ),
                          SliderView(
                            number_of_items: _productsData == null
                                ? 0
                                : _productsData.length,
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.7 -
                                    60,
                            children: (_productsData == null
                                ? []
                                : [
                                    for (Product item in _productsData)
                                      Productcontainer(
                                        widthPercentage: 0.7,
                                        title: item.name,
                                        containerAxis:
                                            ComponentDirection.vertical,
                                        subTitle: item.sub_title,
                                        img_url: item.images
                                            .firstWhere(
                                                (img) => img.type == true)
                                            .url,
                                        price: item.price,
                                        onTap: (Product item) =>
                                            productItemOnTap(item),
                                        liked: item.is_liked,
                                        product: item,
                                      )
                                  ]),
                          )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Handpicked(),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: Column(
                  children: [
                    TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.8,
                        children: [
                          const SectionTitle(text: "Shop by Brands", showView: true),
                          Gridviewcreator(
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.8 -
                                    70,
                            numberOfColumns: 3,
                            numberOfRows: _cardBrandData.length ~/ 3,
                            children: [
                              for (var item in _cardBrandData)
                                CardCategoryBrand(
                                    id: item.brand_id,
                                    img_url: item.image.url,
                                    containerWidth: KMiniCardBrandWidth,
                                    containerHeight: KMiniCardBrandHeight),
                            ],
                          )
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    TitleComponentContainer(
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      children: const [
                        SectionTitle(
                            text: "Makeup & Skincare", showView: false),
                        SizedBox(
                          height: 19,
                        ),
                        SectionCardBannerCategory(),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              CollapsibleComponent(
                scrollController: _scrollController,
                title: "More about CORA’L",
                child: const FooterComponentElement(),
              ),
            ]),
      ),
    );
  }
}

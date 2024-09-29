import 'package:ecommerce/Constants/Colors.dart';
import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/SubCatergoryScreenData.dart';
import '../Models/Figure.dart';
import '../Models/Product.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/GridViewCreator.dart';
import '../components/ProductContainer.dart';

class CategoriesBrandsProductsScreen extends StatefulWidget {
  static String route = "cat-brand-products";
  const CategoriesBrandsProductsScreen({super.key});

  @override
  State<CategoriesBrandsProductsScreen> createState() =>
      _CategoriesBrandsProductsScreenState();
}

class _CategoriesBrandsProductsScreenState
    extends State<CategoriesBrandsProductsScreen> {
  late List<Product> _productsData;
  int productCount = 255;

  late int id;
  late PageType pageType;
  late String pageTitle;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments
        as CategoryBrandScreenArguments;

    id = args.id;
    pageType = args.pageType;
    pageTitle = args.pageTitle;
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
      )
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

    List<Widget> appBarActions = [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, WishlistScreen.route);
        },
        icon: SvgPicture.asset(
          "${KIconsPath}wishlistHeaderIcon.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.route);
        },
        icon: SvgPicture.asset(
          "${KIconsPath}search.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        style:
            const ButtonStyle(iconColor: WidgetStatePropertyAll(KPrimaryColor)),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.route,
              arguments: CartScreenArguments(
                  previousNavigatorType: PreviousNavigatorType.navigator));
        },
        icon: SvgPicture.asset(
          "${KIconsPath}bagHeaderIcon.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )
    ];

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
              title: pageTitle,
              leadingWidget: appBarLeadingWidget,
              actionsWidgets: appBarActions,
            ),
            bottomSheet: SearchPageBottomBarOption(
              Parentcontext: context,
            ),
            body: Container(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  left: KPageHorizontalPadding,
                  right: KPageHorizontalPadding,
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

class SearchPageBottomBarOption extends StatefulWidget {
  const SearchPageBottomBarOption({super.key, required this.Parentcontext});
  final BuildContext Parentcontext;
  @override
  State<SearchPageBottomBarOption> createState() =>
      _SearchPageBottomBarOptionState();
}

class _SearchPageBottomBarOptionState extends State<SearchPageBottomBarOption> {
  int SelectedSortOption = 0;
  @override
  Widget build(BuildContext context) {
    void onTap() {
      showModalBottomSheet(
          backgroundColor: KPageBackGroundColor,
          context: context,
          isScrollControlled: true,
          builder: (Parentcontext) => StatefulBuilder(
                  builder: (BuildContext context, StateSetter widgetState) {
                return SingleChildScrollView(
                    child: Container(
                  height: 360,
                  color: KshowModalBottomSheetBackgroundColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: KPageBackGroundColor,
                        borderRadius: BorderRadius.circular(KBorderRadius)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: KPageHorizontalPadding),
                    child: ListView(
                      children: [
                        const Text(
                          "Sort By",
                          style: TextStyle(
                              fontSize: 16,
                              color: KGreyColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          color: KGreyColor,
                          thickness: 0.5,
                        ),
                        Container(
                          child: Column(
                            children: [
                              for (var i = 0;
                                  i <
                                      SortOptionForCategoriesBrandsProductsScreen
                                          .length;
                                  i++)
                                RadioListTile(
                                    activeColor: KPrimaryColor,
                                    title: Text(
                                        SortOptionForCategoriesBrandsProductsScreen[
                                            i]),
                                    value: i,
                                    groupValue: SelectedSortOption,
                                    onChanged: (value) {
                                      widgetState(() {
                                        SelectedSortOption = value!;
                                      });
                                    })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
              }));
    }

    return Container(
      height: 60,
      color: KPageBackGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            label: const Text(
              "SORT",
              style: TextStyle(
                  color: KTextDarkColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            onPressed: onTap,
            icon: SvgPicture.asset("${KIconsPath}sort.svg"),
          ),
          TextButton.icon(
            label: const Text(
              "FILTER",
              style: TextStyle(
                  color: KTextDarkColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            onPressed: onTap,
            icon: SvgPicture.asset("${KIconsPath}filter.svg"),
          )
        ],
      ),
    );
  }
}

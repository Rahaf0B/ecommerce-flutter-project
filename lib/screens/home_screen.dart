import 'package:ecommerce/Constants/ScreensArguments.dart';
import 'package:ecommerce/Models/Brand.dart';
import 'package:ecommerce/Models/Category.dart';
import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/components/Devices.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../components/DesktopPagesAppBar.dart';
import '../components/FooterComponentElement.dart';
import '../components/GridViewCreator.dart';
import '../components/Handpicked.dart';
import '../components/HomeScreenDrawer.dart';
import '../components/PagesAppBar.dart';
import '../components/ProductContainer.dart';
import '../components/SearchBarComponent.dart';
import '../components/SectionCardBannerCategory.dart';
import '../components/SectionTitle.dart';
import '../components/SliderView.dart';
import '../components/TitleComponentContainer.dart';
import 'categories_brands_products_screen.dart';

class HomeScreen extends StatefulWidget {
  static String route = "home";
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
              product_id: product.product_id,
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
          name: "Skincare",
          image: Figure(image_id: 1, url: "${KIconsPath}skincareIcon.svg"),
          category_id: 1),
      Category(
          name: "Jewellery",
          image: Figure(image_id: 1, url: "${KIconsPath}jewelleryIcon.svg"),
          category_id: 2),
      Category(
          name: "Handbags",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-bag.svg"),
          category_id: 3),
      Category(
          name: "Watches",
          image: Figure(image_id: 1, url: "${KIconsPath}icon-watch.svg"),
          category_id: 4),
      Category(
          name: "Eyewear",
          image: Figure(image_id: 1, url: "${KIconsPath}skincareIcon.svg"),
          category_id: 5),
    ];

    super.initState();
  }

  bool showSearch = false;
  String userName = "Tina";

  String user_img_url = "${KImagesPath}userImg.png";

  List<Map<int, String>> contactElement = [
    {1: "Help & Support"},
    {2: "Feedback & Suggestions"},
    {3: "Visit Websites"}
  ];
  @override
  Widget build(BuildContext context) {
    _cardBannerData = [
      CardBanner(
        height: Devices.IsDesktop(context) ? 0.4.sh : 0.2.sh,
        image_url: "${KImagesPath}shoulderGirl.png",
        upperComponent: BannerContent(
            width: 190.w,
            title: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              "Carry your Funk",
              style: TextStyle(
                  color: KPrimaryColor,
                  fontSize: Devices.IsDesktop(context) ? 10.sp : 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: KTextFont),
            ),
            subTitle: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                "Trendy handbags collection for your party animal",
                style: TextStyle(
                    color: KPrimaryColor,
                    fontSize: Devices.IsDesktop(context) ? 8.sp : 10.sp,
                    fontFamily: KTextFont))),
      ),
      CardBanner(
          height: Devices.IsDesktop(context) ? 0.4.sh : 0.2.sh,
          image_url: "${KImagesPath}idk.png",
          upperComponent: BannerContent(
              showBackground: false,
              direction: Direction.left,
              width: Devices.IsMobile(context) ? 190.w : 100.sw,
              title: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                "Spring Summer Collection",
                style: TextStyle(
                    color: KDarkRedColor,
                    fontSize: Devices.IsDesktop(context) ? 10.sp : 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: KTextFont),
              ),
              subTitle: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: KBrightOrangeColor,
                    borderRadius: BorderRadius.circular(KBorderRadius)),
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    "UPTO 20% OFF",
                    style: TextStyle(
                        color: KDarkRedColor,
                        fontSize: Devices.IsDesktop(context) ? 8.sp : 10.sp,
                        fontFamily: KTextFont)),
              )))
    ];

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
        width: 35.w,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );

    List<Widget> appBarActions = [
      IconButton(
        onPressed: () {
          // Navigator.pushNamed(context, SearchScreen.route);
          setState(() {
            showSearch = true;
          });
        },
        icon: SvgPicture.asset(
          "${KIconsPath}search.svg",
          width: 25.w,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, ProfileScreen.route);
        },
        icon: SvgPicture.asset(
          "${KIconsPath}ProfileIcon.svg",
          width: 25.w,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )
    ];

    void changePageOnTap(
        {required PageType pageType,
        required int id,
        required String pageName,
        SubPageType? subPageType = SubPageType.None}) {
      switch (pageType) {
        case PageType.category:
          Navigator.pushNamed(context, CategoriesBrandsProductsScreen.route,
              arguments: CategoryBrandScreenArguments(
                  id: id, pageType: pageType, pageTitle: pageName));
          break;

        case PageType.subCategory:
          Navigator.pushNamed(context, "sub-category",
              arguments: SubCategoryScreenArguments(
                  id: id, type: pageType, pageTitle: pageName));
          break;
        case PageType.brand:
          Navigator.pushNamed(context, "cat-brand-products",
              arguments: CategoryBrandScreenArguments(
                  id: id, pageType: pageType, pageTitle: pageName));
          break;
        case PageType.trendingDeals:
          Navigator.pushNamed(context, "sub-category",
              arguments: SubCategoryScreenArguments(
                  id: id,
                  type: pageType,
                  subPageType: subPageType,
                  pageTitle: pageName));
          break;

        default:
          break;
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeScreenDrawer(
          onTap: changePageOnTap,
          user_img_url: user_img_url,
          userName: userName,
          topCategoriesElement: _cardCategoryData,
          contactElement: contactElement),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Devices.IsMobile(context)
              ? KMobileAppBarHeight
              : KDesktopAppBarHeight),
          child: Devices(
              mobile: showSearch
                  ? SearchBarComponent(
                      toggleComponent: () => setState(() {
                            showSearch = false;
                          }))
                  : PagesAppBar(
                      title: "Home",
                      actionsWidgets: appBarActions,
                      leadingWidget: appBarLeadingWidget,
                    ),
              desktop: DesktopPagesAppBar())),
      body: showSearch
          ? SearchScreen()
          : Container(
              child: ListView(controller: _scrollController, children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KPageHorizontalPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SliderView(
                          children: _cardBannerData,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Devices.IsMobile(context)
                            ? TitleComponentContainer(
                                children: [
                                  const SectionTitle(
                                    title: 'Top Categories',
                                    showView: false,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SliderView(
                                    children: [
                                      for (var item in _cardCategoryData)
                                        CardCategoryBrand(
                                          type: PageType.category,
                                          onTap: changePageOnTap,
                                          img_url: item.image.url,
                                          title: item.name,
                                          id: item.category_id,
                                          containerHeight:
                                              KMiniCardCategoryHeight,
                                          containerWidth:
                                              KMiniCardCategoryWidth,
                                        ),
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: Devices.IsDesktop(context) ? 20.h : 5.h,
                        ),
                        TitleComponentContainer(
                          children: [
                            SectionTitle(
                              onTap: changePageOnTap,
                              pageType: PageType.subCategory,
                              subPageType: SubPageType.newArrivals,
                              title: "New Arrivals",
                              showView: true,
                            ),
                            SizedBox(
                              height: Devices.IsDesktop(context) ? 40.h : 10.h,
                            ),
                            SliderView(

                              children: (_productsData == null
                                  ? []
                                  : [
                                      for (Product item in _productsData)
                                        Productcontainer(
                                          widthPercentage:
                                              Devices.IsDesktop(context)
                                                  ? 0.15.sw
                                                  : 0.4.sw,
                                          title: item.name,
                                          containerAxis:
                                              ComponentDirection.vertical,
                                          subTitle: item.sub_title,
                                          img_url: item.images
                                              .firstWhere(
                                                  (img) => img.type == true)
                                              .url,
                                          price: item.price,
                                          onTap: Devices.IsMobile(context)
                                              ? (Product item) =>
                                                  productItemOnTap(item)
                                              : (Product item) {},
                                          liked: item.is_liked,
                                          product: item,
                                        )
                                    ]),
                            )
                          ],
                        ),
                      ]),
                ),
                SizedBox(
                  height: Devices.IsDesktop(context) ? 50.h : 30.h,
                ),
                Handpicked(
                  onTap: changePageOnTap,
                ),
                SizedBox(
                  height: Devices.IsDesktop(context) ? 40.h : 24.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KPageHorizontalPadding),
                  child: Column(
                    children: [
                      TitleComponentContainer(children: [
                        const SectionTitle(
                            title: "Shop by Brands", showView: false),
                        SizedBox(
                          height: Devices.IsDesktop(context) ? 40.h : 10.h,
                        ),
                        Gridviewcreator(
                          numberOfColumns: Devices.IsMobile(context)
                              ? 3
                              : _cardBrandData.length,
                          numberOfRows: Devices.IsMobile(context)
                              ? _cardBrandData.length ~/ 3
                              : 1,
                          children: [
                            for (var item in _cardBrandData)
                              CardCategoryBrand(
                                  title: item.name,
                                  showTitle: false,
                                  onTap: changePageOnTap,
                                  type: PageType.brand,
                                  id: item.brand_id,
                                  img_url: item.image.url,
                                  containerWidth: KMiniCardBrandWidth,
                                  containerHeight: KMiniCardBrandHeight),
                          ],
                        )
                      ]),
                      SizedBox(
                        height: Devices.IsDesktop(context) ? 50.h : 15.h,
                      ),
                      TitleComponentContainer(
                        children: [
                          const SectionTitle(
                              title: "Trending Deals", showView: false),
                          SizedBox(
                            height: Devices.IsDesktop(context) ? 40.h : 10.h,
                          ),
                          SectionCardBannerCategory(
                            onTap: changePageOnTap,
                            type: PageType.trendingDeals,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Devices.IsDesktop(context) ? 50.h : 5.h,
                      ),
                    ],
                  ),
                ),
                Devices(
                  mobile: CollapsibleComponent(
                    scrollController: _scrollController,
                    title: "More about CORA’L",
                    child: const FooterComponentElement(),
                  ),
                  desktop: FooterComponentElement(),
                )
              ]),
            ),
    );
  }
}

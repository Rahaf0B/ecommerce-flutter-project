import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();
  void productItemOnTap() {
    showModalBottomSheet(
        backgroundColor: KPageBackGroundColor,
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
                child: BottomSheetProductSubInfoComponent(
              title: "Grande",
              img_url: KImagesPath + "bag1.png",
              price: 39.49,
              subTitle: "Blossom Pouch",
              rating: 4.5,
              numberOfReviews: 43,
            )));
  }

  late List<CardBanner> _cardBannerData;
  late List<Productcontainer> _productsData;
  late List<CardCategoryBrand> _cardBrandData;
  late List<CardCategoryBrand> _cardCategoryData;

  @override
  void initState() {
    // TODO: implement initState

    _cardBannerData = [
      CardBanner(
        // height: 150,
        image_url: KImagesPath + "shoulderGirl.png",
        upperComponent: BannerContent(
            width: 0.93,
            title: "Carry your Funk",
            subTitle: "Trendy handbags collection for your party animal"),
      ),
      CardBanner(

          // height: 150,
          image_url: KImagesPath + "shoulderGirl.png",
          upperComponent: BannerContent(
              width: 0.93,
              title: "Carry your Funk",
              subTitle: "Trendy handbags collection for your party animal"))
    ];

    _productsData = [
      Productcontainer(
        widthPercentage: 0.7,
        title: "Grande",
        containerAxis: ComponentDirection.vertical,
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        onTap: productItemOnTap,
      ),
      Productcontainer(
        widthPercentage: 0.7,
        title: "Grande",
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        onTap: productItemOnTap,
        containerAxis: ComponentDirection.vertical,
      ),
      Productcontainer(
        widthPercentage: 0.7,
        title: "Grande",
        containerAxis: ComponentDirection.vertical,
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        onTap: productItemOnTap,
      ),
      Productcontainer(
        widthPercentage: 0.7,
        title: "Grande",
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        containerAxis: ComponentDirection.vertical,
        price: 39.49,
        onTap: productItemOnTap,
      ),
      Productcontainer(
          widthPercentage: 0.7,
          containerAxis: ComponentDirection.vertical,
          title: "Grande",
          subTitle: "Blossom Pouch",
          img_url: KImagesPath + "bag1.png",
          price: 39.49),
      Productcontainer(
          widthPercentage: 0.7,
          containerAxis: ComponentDirection.vertical,
          title: "Grande",
          subTitle: "Blossom Pouch",
          img_url: KImagesPath + "bag1.png",
          price: 39.49)
    ];

    _cardBrandData = [
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight),
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight),
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight),
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight),
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight),
      CardCategoryBrand(
          img_url: KIconsPath + "Zara_Logo.svg",
          containerWidth: KMiniCardBrandWidth,
          containerHeight: KMiniCardBrandHeight)
    ];
    _cardCategoryData = [
      CardCategoryBrand(
        img_url: KIconsPath + "icon-bag.svg",
        text: "Handbags",
        containerHeight: KMiniCardCategoryHeight,
        containerWidth: KMiniCardCategoryWidth,
      ),
      CardCategoryBrand(
        img_url: KIconsPath + "icon-bag.svg",
        text: "Handbags",
        containerHeight: KMiniCardCategoryHeight,
        containerWidth: KMiniCardCategoryWidth,
      ),
      CardCategoryBrand(
        img_url: KIconsPath + "icon-watch.svg",
        text: "Watches",
        containerHeight: KMiniCardCategoryHeight,
        containerWidth: KMiniCardCategoryWidth,
      ),
      CardCategoryBrand(
        img_url: KIconsPath + "icon-bag.svg",
        text: "Handbags",
        containerHeight: KMiniCardCategoryHeight,
        containerWidth: KMiniCardCategoryWidth,
      ),
      CardCategoryBrand(
        img_url: KIconsPath + "icon-watch.svg",
        text: "Watches",
        containerHeight: KMiniCardCategoryHeight,
        containerWidth: KMiniCardCategoryWidth,
      )
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleDrawer() {
      if (_scaffoldKey!.currentState!.isDrawerOpen) {
        _scaffoldKey!.currentState!.closeDrawer();
      } else {
        _scaffoldKey!.currentState!.openDrawer();
      }
    }

    Widget _appBarLeadingWidget = IconButton(
      onPressed: () {
        toggleDrawer();
      },
      icon: SvgPicture.asset(
        KIconsPath + "leading-icon.svg",
        fit: BoxFit.cover,
        width: 40,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );

    List<Widget> _appBarActions = [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          KIconsPath + "search.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          KIconsPath + "ProfileIcon.svg",
          width: 30,
          fit: BoxFit.cover,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: PagesAppBar(
        title: "Home",
        actionsWidgets: _appBarActions,
        leadingWidget: _appBarLeadingWidget,
      ),
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SliderView(
                        number_of_items: 2,
                        children: _cardBannerData,
                        height: MediaQuery.of(context).size.height *
                            (50 / 100) *
                            0.4,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.35,
                        children: [
                          SectionTitle(
                            text: 'Top Categories',
                            showView: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SliderView(
                            number_of_items: _cardCategoryData!.length,
                            children: _cardCategoryData!,
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.4 -
                                    70,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.7,
                        children: [
                          SectionTitle(
                            text: "New Arrivals",
                            showView: true,
                          ),
                          SliderView(
                            number_of_items: _productsData == null
                                ? 0
                                : _productsData.length,
                            children:
                                _productsData == null ? [] : _productsData,
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.7 -
                                    60,
                          )
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              Handpicked(),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: Column(
                  children: [
                    TitleComponentContainer(
                        height: MediaQuery.of(context).size.height * 0.5 * 0.8,
                        children: [
                          SectionTitle(text: "Shop by Brands", showView: true),
                          Gridviewcreator(
                            children: _cardBrandData,
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.8 -
                                    70,
                            numberOfColumns: 3,
                            numberOfRows: (_cardBrandData.length / 3).toInt(),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    TitleComponentContainer(
                      height: MediaQuery.of(context).size.height * 0.5 * 1,
                      children: [
                        SectionTitle(
                            text: "Makeup & Skincare", showView: false),
                        SizedBox(
                          height: 19,
                        ),
                        SectionCardBannerCategory(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              CollapsibleComponent(
                scrollController: _scrollController,
                title: "More about CORA’L",
                child: FooterComponentElement(),
              ),
            ]),
      ),
    );
  }
}

import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
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
  const ProductScreen({Key? key}) : super(key: key);
  static const route = "product";
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Productcontainer> _productsData;
  late List<ProductImgContainer> _productImages;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

    _productImages = [
      ProductImgContainer(
        img_url: KImagesPath + "bag-thumbnail.png",
      ),
      ProductImgContainer(
        img_url: KImagesPath + "bag-thumbnail.png",
      ),
      ProductImgContainer(
        img_url: KImagesPath + "bag-thumbnail.png",
      )
    ];
  }

//TODO GET THIS FROM API
  String productName = "Grande";
  String productSubTitle = "Blossom Pouch";
  String productDescription =
      "Experience comfortable and easy travelling like never before with this coach bag. It features a zip closure, removable straps and multiple organization compartments to keep your valuables safe. Crafted from premium material, it is durable and lasts long.";
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    Widget _leadAppBarWidget = Icon(
      Icons.arrow_back_ios_new_outlined,
      color: KPrimaryColor,
    );
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(leadingWidget: _leadAppBarWidget),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(
          btn_text: "Add to Bag",
          right_btn_img_url: KIconsPath + "bagIconOutline.svg",
          left_btn_img_url: KIconsPath + "wishlist.svg",
        ),
      ),
      body: Container(
        child: ListView(
          controller: _scrollController,
          children: [
            Container(
                padding:
                    EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(0),
                        height: MediaQuery.of(context).size.height *
                            (50 / 100) *
                            0.9,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: SliderView(
                          number_of_items: 3,
                          children: _productImages,
                          height: MediaQuery.of(context).size.height *
                              (50 / 100) *
                              0.4,
                        ),
                      ),
                      ProductSubInfo(
                          width: 1,
                          elementType: ElementType.page,
                          title: productName,
                          subTitle: productSubTitle,
                          marginTop: 10,
                          price: 39.49,
                          discountValue: 50),
                      SizedBox(
                        height: 15,
                      ),
                      AvgRatingComponent(
                        show_icon: false,
                        rating: 4.5,
                        numberOfReviews: 24,
                      ),
                    ])),
            SizedBox(height: 20),
            Container(
                child: Column(children: [
              Divider(
                color: KGreyBackGroundColor,
                thickness: 10,
              ),
              CollapsibleComponent(
                  title: "Product Description",
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: KPageHorizontalPadding),
                      child: Text(
                          style: TextStyle(color: KGreyColor),
                          productDescription)),
                  scrollController: _scrollController),
            ])),
            Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: KPageHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Ratings & Reviews",
                      style: TextStyle(
                          color: KTextDarkColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: SvgPicture.asset(KIconsPath + "arrowRight.svg"),
                  )
                ],
              ),
            ),
            Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 20, horizontal: KPageHorizontalPadding),
              margin: EdgeInsets.only(bottom: 70),
              child: TitleComponentContainer(
                height: MediaQuery.of(context).size.height * 0.5 * 0.65,
                children: [
                  SectionTitle(
                    text: "You Might Also Like",
                    showView: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SliderView(
                    number_of_items:
                        _productsData == null ? 0 : _productsData.length,
                    children: _productsData == null ? [] : _productsData,
                    height: MediaQuery.of(context).size.height * 0.5 * 0.7 - 60,
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
    return ClipRRect(
        borderRadius: BorderRadius.circular(KBorderRadius),
        child: Image.asset(
          fit: BoxFit.cover,
          img_url,
        ));
  }
}

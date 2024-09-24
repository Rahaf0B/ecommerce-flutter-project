import 'package:ecommerce/components/GridViewCreator.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../Constants/SubCatergoryScreenData.dart';
import '../components/ProductContainer.dart';

class SubCategoriesScreen extends StatefulWidget {
  static const route = "sub-category";
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  List<Productcontainer> productsData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productsData = [
      Productcontainer(
        widthPercentage: 0.85,
        title: "Grande",
        containerAxis: ComponentDirection.vertical,
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        discountValue: 50,
      ),
      Productcontainer(
        widthPercentage: 0.85,
        title: "Grande",
        containerAxis: ComponentDirection.vertical,
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        discountValue: 50,
      ),
      Productcontainer(
          widthPercentage: 0.85,
          title: "Grande",
          subTitle: "Blossom Pouch",
          img_url: KImagesPath + "bag1.png",
          price: 39.49,
          containerAxis: ComponentDirection.vertical,
          discountValue: 50),
      Productcontainer(
          widthPercentage: 0.85,
          title: "Grande",
          subTitle: "Blossom Pouch",
          img_url: KImagesPath + "bag1.png",
          price: 39.49,
          containerAxis: ComponentDirection.vertical,
          discountValue: 50),
      Productcontainer(
          widthPercentage: 0.85,
          title: "Grande",
          subTitle: "Blossom Pouch",
          containerAxis: ComponentDirection.vertical,
          img_url: KImagesPath + "bag1.png",
          price: 39.49,
          discountValue: 50),
      Productcontainer(
        widthPercentage: 0.85,
        title: "Grande",
        subTitle: "Blossom Pouch",
        img_url: KImagesPath + "bag1.png",
        price: 39.49,
        containerAxis: ComponentDirection.vertical,
        discountValue: 50,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarLeadingWidget = Icon(
      Icons.arrow_back_ios_new_outlined,
      color: KPrimaryColor,
    );

    //TODO get these from the page parameters
    String appBarTitle = "Handbags";
    int productCount = 255;
    return SafeArea(
      child: Scaffold(
          appBar: PagesAppBar(
            leadingWidget: appBarLeadingWidget,
            title: appBarTitle,
          ),
          bottomSheet: SearchPageBottomBarOption(
            Parentcontext: context,
          ),
          extendBodyBehindAppBar: false,
          body: Container(
              padding: EdgeInsets.only(
                bottom: 60,
                left: KPageHorizontalPadding,
                right: KPageHorizontalPadding,
              ),
              child: ListView(children: [
                Text(
                  productCount.toString() + " " + "Products",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: KGreyColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Gridviewcreator(
                    children: productsData,
                    numberOfColumns: 2,
                    numberOfRows: (productsData.length / 2).toInt())
              ]))),
    );
  }
}

class SearchPageBottomBarOption extends StatefulWidget {
  const SearchPageBottomBarOption({Key? key, required this.Parentcontext})
      : super(key: key);
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
                  decoration: BoxDecoration(
                      color: KPageBackGroundColor,
                      borderRadius: BorderRadius.circular(KBorderRadius)),
                  padding: EdgeInsets.symmetric(
                      vertical: 20, horizontal: KPageHorizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sort By",
                        style: TextStyle(
                            fontSize: 16,
                            color: KGreyColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: KGreyColor,
                        thickness: 0.5,
                      ),
                      Container(
                        child: Column(
                          children: [
                            for (var i = 0; i < SortOption.length; i++)
                              RadioListTile(
                                  title: Text(SortOption[i]),
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
            label: Text(
              "SORT",
              style: TextStyle(
                  color: KTextDarkColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            onPressed: onTap,
            icon: SvgPicture.asset(KIconsPath + "sort.svg"),
          ),
          TextButton.icon(
            label: Text(
              "FILTER",
              style: TextStyle(
                  color: KTextDarkColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            onPressed: onTap,
            icon: SvgPicture.asset(KIconsPath + "filter.svg"),
          )
        ],
      ),
    );
  }
}

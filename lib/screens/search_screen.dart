import 'package:ecommerce/components/GridViewCreator.dart';
import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/Enums.dart';
import '../components/BottomSheetProductSubInfoComponent.dart';
import '../components/ProductContainer.dart';
import '../components/RecentSearch.dart';
import '../components/SearchBarComponent.dart';
import '../components/SectionTitle.dart';
import '../components/SliderView.dart';
import '../components/TitleComponentContainer.dart';

class SearchScreen extends StatefulWidget {
  static String route = "search";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Widget> recentSerachValue = [];
  late List<Productcontainer> productsData;

  void productItemOnTap() {
    showModalBottomSheet(
        backgroundColor: KPageBackGroundColor,
        context: context,
        isScrollControlled: true,
        useSafeArea: true,

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
    recentSerachValue = [
      RecentSearch(
        text: "Womens Wrist Watches",
      ),
      RecentSearch(
        text: "Womens Wrist Watches",
      ),
      RecentSearch(
        text: "Womens Wrist Watches",
      )
    ];
    productsData = [
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SearchBarComponent(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: ListView(
          children: [
            TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.4,
              children: [
                SectionTitle(
                  text: "Recent Searchs",
                  showView: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Gridviewcreator(
                    numberOfColumns: 2,
                    numberOfRows: (recentSerachValue.length / 2).round(),
                    children: recentSerachValue!),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TitleComponentContainer(
              height: MediaQuery.of(context).size.height * 0.5 * 0.7,
              children: [
                SectionTitle(
                  text: "New Arrivals",
                  showView: false,
                ),
                SizedBox(
                  height: 15,
                ),
                SliderView(
                  number_of_items:
                      productsData == null ? 0 : productsData.length,
                  children: productsData == null ? [] : productsData,
                  height: MediaQuery.of(context).size.height * 0.5 * 0.7 - 60,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:ecommerce/screens/PagesContainerWithNavigator.dart';
import 'package:ecommerce/screens/add_review_screen.dart';
import 'package:ecommerce/screens/order_summary_screen.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/screens/reviews_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants/Colors.dart';
import 'Constants/Constant.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OrderSummaryScreen.route,
      debugShowCheckedModeBanner: false,
      routes: {
        PagesContainerWithNavigator.route: (context) =>
            PagesContainerWithNavigator(),
        SearchScreen.route: (context) => SearchScreen(),
        SubCategoriesScreen.route:(context)=>SubCategoriesScreen(),
        ProductScreen.route:(context)=>ProductScreen(),
        ReviewsScreen.route: (context) => ReviewsScreen(),
        AddReviewScreen.route: (context) => AddReviewScreen(),
        OrderSummaryScreen.route: (context) => OrderSummaryScreen(),


      },
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              backgroundColor: KPageBackGroundColor),
          fontFamily: KTextFont,
          scaffoldBackgroundColor: KPageBackGroundColor,

          bottomAppBarTheme: BottomAppBarTheme(color: KPageBackGroundColor),
          appBarTheme: AppBarTheme(
            toolbarHeight: 80,
            scrolledUnderElevation: 0,
            color: KPageBackGroundColor,
          ),
      ),
    );
  }
}

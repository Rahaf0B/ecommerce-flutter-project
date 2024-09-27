import 'package:ecommerce/screens/PagesContainerWithNavigator.dart';
import 'package:ecommerce/screens/add_new_address_screen.dart';
import 'package:ecommerce/screens/add_review_screen.dart';
import 'package:ecommerce/screens/categories_brands_products_screen.dart';
import 'package:ecommerce/screens/categories_screen.dart';
import 'package:ecommerce/screens/confirmed_screen.dart';
import 'package:ecommerce/screens/order_summary_screen.dart';
import 'package:ecommerce/screens/payments_screen.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/reviews_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/screens/account_login_option_screen_screen.dart';
import 'package:ecommerce/screens/sub_categories_screen.dart';
import 'package:ecommerce/screens/welcome_screen.dart';
import 'package:ecommerce/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants/Colors.dart';
import 'Constants/Constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AccountLoginOptionScreen.route,
      debugShowCheckedModeBanner: false,
      routes: {
        PagesContainerWithNavigator.route: (context) =>
            const PagesContainerWithNavigator(),
        SearchScreen.route: (context) => const SearchScreen(),
        SubCategoriesScreen.route: (context) => const SubCategoriesScreen(),
        ProductScreen.route: (context) => const ProductScreen(),
        ReviewsScreen.route: (context) => const ReviewsScreen(),
        AddReviewScreen.route: (context) => const AddReviewScreen(),
        OrderSummaryScreen.route: (context) => const OrderSummaryScreen(),
        AddNewAddressScreen.route: (context) => const AddNewAddressScreen(),
        PaymentsScreen.route: (context) => const PaymentsScreen(),
        ConfirmedScreen.route: (context) => const ConfirmedScreen(),
        CategoriesBrandsProductsScreen.route: (context) => const CategoriesBrandsProductsScreen(),
        ProfileScreen.route: (context) => const ProfileScreen(),
        CategoriesScreen.route: (context) =>  CategoriesScreen(),
        WishlistScreen.route: (context) => const WishlistScreen(),
        WelcomeScreen.route: (context) => const WelcomeScreen(),
        AccountLoginOptionScreen.route:(context) => const AccountLoginOptionScreen()
      },
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
            shape: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            backgroundColor: KPageBackGroundColor),
        fontFamily: KTextFont,
        scaffoldBackgroundColor: KPageBackGroundColor,
        bottomAppBarTheme: const BottomAppBarTheme(color: KPageBackGroundColor),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          scrolledUnderElevation: 0,
          color: KPageBackGroundColor,
        ),
      ),
    );
  }
}

import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'home_screen.dart';

class PagesContainerWithNavigator extends StatefulWidget {
  static const route = "home";
  const PagesContainerWithNavigator({super.key});

  @override
  State<PagesContainerWithNavigator> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PagesContainerWithNavigator> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  int _currentIndexPage = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen()
  ];
  // int _currentIndex=0;
  final List<BottomNavigationBarItem> _bottomNavigatorChildren = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "${KIconsPath}home.svg",
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("${KIconsPath}categories.svg"),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset("${KIconsPath}bag.svg"),
      label: 'Cart',
    )
  ];
  @override
  Widget build(BuildContext context) {
    void changePageIndex(int indexPage) {
      setState(() {
        _currentIndexPage = indexPage;
      });
      print(_currentIndexPage);
    }

    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndexPage],
        bottomNavigationBar: BottomNavigator(
          currentIndexPage: _currentIndexPage,
          navigatorTaps: _bottomNavigatorChildren,
          onPress: changePageIndex,
        ),
      ),
    );
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator(
      {super.key,
      required this.currentIndexPage,
      required this.onPress,
      required this.navigatorTaps});
  final int currentIndexPage;
  final Function onPress;
  final List<BottomNavigationBarItem> navigatorTaps;
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.currentIndexPage;

    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(color: KPrimaryColor),
      showUnselectedLabels: false,
      showSelectedLabels: true,
      currentIndex: currentIndex,
      elevation: 0,
      selectedItemColor: KPrimaryColor,
      backgroundColor: KPageBackGroundColor,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => widget.onPress(value),
      items: widget.navigatorTaps,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'home_screen.dart';


class PagesContainerWithNavigator extends StatefulWidget {
  static const route = "home";
  const PagesContainerWithNavigator({Key? key}) : super(key: key);

  @override
  State<PagesContainerWithNavigator> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PagesContainerWithNavigator> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();
  int _currentIndexPage = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Container(),

  ];
  // int _currentIndex=0;
  List<BottomNavigationBarItem> _bottomNavigatorChildren=[
    BottomNavigationBarItem(
    icon: SvgPicture.asset(
      KIconsPath+"home.svg",
    ),
    label: 'Home',
  ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset( KIconsPath+"categories.svg"),
      label: 'Categories',
    ),

    BottomNavigationBarItem(
      icon: SvgPicture.asset( KIconsPath+"bag.svg"),
      label: 'Cart',
    )];
  @override
  Widget build(BuildContext context) {
    void ChangePageIndex(int indexPage) {

      setState(() {
        _currentIndexPage =indexPage;
      });
      print(_currentIndexPage);
    }
    return SafeArea(
      child: Scaffold(

        body: _children[_currentIndexPage],
        bottomNavigationBar:
        BottomNavigator(currentIndexPage: _currentIndexPage, navigatorTaps: _bottomNavigatorChildren, onPress:ChangePageIndex ,),

      ),
    );
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({
    Key? key,
    required this.currentIndexPage,
    required this.onPress,
    required this.navigatorTaps
  }) : super(key: key);
   final int currentIndexPage;
final Function onPress;
final List<BottomNavigationBarItem> navigatorTaps;
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  @override
  Widget build(BuildContext context) {
    int _currentIndex=widget.currentIndexPage;

    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(color: KPrimaryColor),
      showUnselectedLabels: false,
      showSelectedLabels: true,
      currentIndex: _currentIndex,
      elevation: 0,
      selectedItemColor: KPrimaryColor,
      backgroundColor: KPageBackGroundColor,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => widget.onPress(value),
      items:widget.navigatorTaps,
    );
  }
}

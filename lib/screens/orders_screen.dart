import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/items_ordered_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../Constants/ScreensArguments.dart';
import 'order_summary_screen.dart';

class OrdersScreen extends StatefulWidget {
  static String route = "orders";
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _selectedTap = 0;
  List<Map<int, List<String>>> orders = [
    {
      1: ["September 5, 2020", "874522648", "218.50"]
    },
    {
      2: ["September 5, 2020", "874522648", "218.50"]
    },
    {
      3: ["September 5, 2020", "874522648", "218.50"]
    },
    {
      4: ["September 5, 2020", "874522648", "218.50"]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "My Orders",
        leadingWidget: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: KPrimaryColor,
            )),
        actionsWidgets: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.route);
            },
            icon: SvgPicture.asset(
              "${KIconsPath}bagHeaderIcon.svg",
              width: 30,
              fit: BoxFit.cover,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: KGreyBackGroundColor,
                    borderRadius: BorderRadius.circular(KBorderRadius)),
                child: TabBar(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  padding: const EdgeInsets.all(0),
                  tabAlignment: TabAlignment.fill,
                  indicatorWeight: 0.1,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  onTap: (value) {
                    setState(() {
                      _selectedTap = value;
                    });
                  },
                  tabs: [
                    Tab(
                      child: Tap(
                        selectedTap: _selectedTap,
                        id: 0,
                        title: "Completed",
                      ),
                    ),
                    Tab(
                      child: Tap(
                        selectedTap: _selectedTap,
                        id: 1,
                        title: "Processing",
                      ),
                    ),
                    Tab(
                      child: Tap(
                        selectedTap: _selectedTap,
                        id: 2,
                        title: "Cancelled",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: ListView(shrinkWrap: true, children: [
                        const Text(
                          "4 Order(s)",
                          style: TextStyle(color: KGreyColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        for (var item in orders) ...[
                          OrderDataContainer(
                            order_id: item.keys.first,
                            date: item.values.first[0],
                            number: int.parse(item.values.first[1]),
                            price: double.parse(item.values.first[2]),
                          ),
                        ],
                      ]),
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 120,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 120,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class OrderDataContainer extends StatelessWidget {
  const OrderDataContainer({
    super.key,
    required this.date,
    required this.number,
    required this.price,
    required this.order_id,
  });

  final String date;
  final int number;
  final double price;
  final int order_id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: KGreyBackGroundColor,
          borderRadius: BorderRadius.circular(KBorderRadius)),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(color: KGreyColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("#$number"),
              const SizedBox(
                height: 5,
              ),
              Text("\$$price")
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ItemsOrderedScreen.route,
                    arguments: ItemOrderedScreenArguments(order_id: order_id));
              },
              icon: SvgPicture.asset("${KIconsPath}arrowRight.svg"))
        ],
      ),
    );
  }
}

class Tap extends StatelessWidget {
  const Tap({
    super.key,
    required this.selectedTap,
    required this.title,
    required this.id,
  });

  final int selectedTap;
  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),

      decoration: BoxDecoration(
          color: selectedTap == id ? KPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(KBorderRadius)),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12, color: selectedTap == id ? KBrightColor : KGreyColor),
      ),
    );
  }
}

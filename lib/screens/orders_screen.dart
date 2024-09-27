import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class OrdersScreen extends StatefulWidget {
  static String route = "orders";
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _selectedTap = 0;
  List<List<String>> orders = [
    ["September 5, 2020", "874522648", "218.50"],
    ["September 5, 2020", "874522648", "218.50"],
    ["September 5, 2020", "874522648", "218.50"],
    ["September 5, 2020", "874522648", "218.50"]
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "My Orders",
        leadingWidget: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: KPrimaryColor,
        ),
        actionsWidgets: [
          IconButton(
            onPressed: () {},
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
          padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: KGreyBackGroundColor,
                    borderRadius: BorderRadius.circular(KBorderRadius)),
                child: TabBar(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),

                  padding: EdgeInsets.all(0),
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
              Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ListView(shrinkWrap: true, children: [
                        Text(
                          "4 Order(s)",
                          style: TextStyle(color: KGreyColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        for (var item in orders) ...[
                          OrderDataContainer(
                            date: item[0],
                            number: int.parse(item[1]),
                            price: double.parse(item[2]),
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
  });

  final String date;
  final int number;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: KGreyBackGroundColor,
          borderRadius: BorderRadius.circular(KBorderRadius)),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(color: KGreyColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text("#${number}"),
              SizedBox(
                height: 5,
              ),
              Text("\$${price}")
            ],
          ),
          IconButton(
              onPressed: () {},
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
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12, color: selectedTap == id ? KBrightColor : KGreyColor),
      ),

      decoration: BoxDecoration(
          color: selectedTap == id ? KPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(KBorderRadius)),
    );
  }
}

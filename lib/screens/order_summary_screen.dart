import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../components/OrderDetailsContainer.dart';
import '../components/OrderProductContainer.dart';
import '../components/SectionTitle.dart';
import '../components/TitleComponentContainer.dart';

class OrderSummaryScreen extends StatefulWidget {
  static String route = "order-summary";
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  List<OrderProductContainer> products = [];
  List<AddressDataContainer> address = [];
  double subTotalValue = 0.0;
  double discountValue = 0.0;
  double deliveryFeeValue = 0.0;
  String selectedUserNameForAddress = "Ruby S Snively";
  String selectedAddress = "1460  Jenric Lane, Ashmor Drive";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subTotalValue = 119.69;
    discountValue = 13.40;
    deliveryFeeValue = 0.0;
    products = [
      OrderProductContainer(
        img_url: KImagesPath + "bag1.png",
        title: "Coach",
        date: "08 Dec",
        subtitle: "Leather Coach Bag",
      ),
      OrderProductContainer(
        img_url: KImagesPath + "bag1.png",
        title: "Coach",
        date: "08 Dec",
        subtitle: "Leather Coach Bag",
      ),
    ];

    address = [
      AddressDataContainer(
        userNameForAddress: "Ruby S Snively",
        location: "1460  Jenric Lane, Ashmor Drive ",

        phoneNumber: "414-672-5388",
      ),
      AddressDataContainer(
        userNameForAddress: "Vincent Lobo",
        location: "3068  Woodlawn Drive",
        phoneNumber: "414-672-5388",
      ),

    ];
  }

  void ChageAddressOnTap() {
    AddressDataContainer? selectedAddress = address[0];

    showModalBottomSheet(
        backgroundColor: KPageBackGroundColor,
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter widgetState) =>
                  SingleChildScrollView(
                      child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Delivery Address",
                            style: TextStyle(color: KGreyColor),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Add Address",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            icon: SvgPicture.asset(KIconsPath + "plus.svg"),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: KGreyBackGroundColor,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: address.length,
                          itemBuilder: (context, index) => Container(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Radio<AddressDataContainer>(
                                    activeColor: KPrimaryColor,
                                    value: address[index],
                                    groupValue: selectedAddress,
                                    onChanged: (AddressDataContainer? value) {
                                      widgetState(() {
                                        selectedAddress = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  address[index]
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: KPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: KPageBackGroundColor,
      appBar: PagesAppBar(
        leadingWidget: Icon(Icons.arrow_back_ios_new_outlined),
        title: "Order Summary",
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(btn_text: "Proceed to Payments"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TitleComponentContainer(
                      height: MediaQuery.of(context).size.height * 0.5 * 0.35,
                      children: [
                        SectionTitle(
                          text: "Deliver To",
                          showView: false,
                          textColor: KGreyColor,
                          titleFontSize: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: KGreyBackGroundColor,
                              borderRadius:
                                  BorderRadius.circular(KBorderRadius)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedUserNameForAddress,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: KTextDarkColor, fontSize: 15),
                                    ),
                                    Text(selectedAddress,
                                        style: TextStyle(
                                            color: KGreyColor, fontSize: 15)),
                                  ]),
                              Container(
                                  decoration: BoxDecoration(
                                      color: KPrimaryColor,
                                      borderRadius:
                                          BorderRadius.circular(KBorderRadius)),
                                  child: IconButton(
                                      onPressed: ChageAddressOnTap,
                                      icon: SvgPicture.asset(
                                          KIconsPath + "edit.svg")))
                            ],
                          ),
                        )
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: TitleComponentContainer(children: [
                    SectionTitle(
                      text: "Expected Delivery",
                      showView: false,
                      textColor: KGreyColor,
                      titleFontSize: 18,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => products[index],
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: products.length),
                    ),
                  ])),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OrderDetailsContainer(
              subTotalValue: subTotalValue,
              discountValue: discountValue,
              deliveryFeeValue: deliveryFeeValue,
            ),
          ],
        ),
      ),
    ));
  }
}

class AddressDataContainer extends StatelessWidget {
  const AddressDataContainer({
    super.key,
    required this.userNameForAddress,
    required this.location,
    required this.phoneNumber,
  });

  final String userNameForAddress;
  final String location;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              userNameForAddress,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: KTextDarkColor),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: KGreyBackGroundColor,
                  borderRadius: BorderRadius.circular(KBorderRadius)),
              child: Text("Home"),
            ),
          ],
        ),
        Text(location,overflow: TextOverflow.ellipsis,),

        Text(phoneNumber),
      ],
    );
  }
}

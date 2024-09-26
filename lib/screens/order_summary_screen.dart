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
  const OrderSummaryScreen({super.key});

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
      const OrderProductContainer(
        img_url: "${KImagesPath}bag1.png",
        title: "Coach",
        date: "08 Dec",
        subtitle: "Leather Coach Bag",
      ),
      const OrderProductContainer(
        img_url: "${KImagesPath}bag1.png",
        title: "Coach",
        date: "08 Dec",
        subtitle: "Leather Coach Bag",
      ),
    ];

    address = [
      const AddressDataContainer(
        userNameForAddress: "Ruby S Snively",
        location: "1460  Jenric Lane, Ashmor Drive ",
        email:"email@g.com",
        phoneNumber: "414-672-5388",
      ),
      const AddressDataContainer(
        userNameForAddress: "Vincent Lobo",
        location: "3068  Woodlawn Drive",
        email:"email@g.com",
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Delivery Address",
                            style: TextStyle(color: KGreyColor),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: const Text(
                              "Add Address",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            icon: SvgPicture.asset("${KIconsPath}plus.svg"),
                          )
                        ],
                      ),
                    ),
                    const Divider(
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  address[index]
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: KPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                          separatorBuilder: (context, index) => const SizedBox(
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
      appBar: const PagesAppBar(
        leadingWidget: Icon(Icons.arrow_back_ios_new_outlined),
        title: "Order Summary",
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(btn_text: "Proceed to Payments"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TitleComponentContainer(
                      height: MediaQuery.of(context).size.height * 0.5 * 0.35,
                      children: [
                        const SectionTitle(
                          text: "Deliver To",
                          showView: false,
                          textColor: KGreyColor,
                          titleFontSize: 18,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
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
                                      style: const TextStyle(
                                          color: KTextDarkColor, fontSize: 15),
                                    ),
                                    Text(selectedAddress,
                                        style: const TextStyle(
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
                                          "${KIconsPath}edit.svg")))
                            ],
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: TitleComponentContainer(children: [
                    const SectionTitle(
                      text: "Expected Delivery",
                      showView: false,
                      textColor: KGreyColor,
                      titleFontSize: 18,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => products[index],
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: products.length),
                    ),
                  ])),
                ],
              ),
            ),
            const SizedBox(
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
    required this.email,
  });

  final String userNameForAddress;
  final String location;
  final String phoneNumber;
  final String email;
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
                  const TextStyle(fontWeight: FontWeight.bold, color: KTextDarkColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: KGreyBackGroundColor,
                  borderRadius: BorderRadius.circular(KBorderRadius)),
              child: const Text("Home"),
            ),
          ],
        ),
        Text(location,overflow: TextOverflow.ellipsis,),
        Text(email),
        Text(phoneNumber),
      ],
    );
  }
}

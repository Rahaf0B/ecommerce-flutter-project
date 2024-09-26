import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/CollapsibleComponent.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../components/MainAddressInfoContainer.dart';
import 'order_summary_screen.dart';

class PaymentsScreen extends StatefulWidget {
  static String route = "payments";
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  String selectedUserNameForAddress = "Ruby S Snively";
  String selectedAddress = "1460  Jenric Lane, Ashmor Drive";
  List<AddressDataContainer> address = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address = [
      const AddressDataContainer(
        userNameForAddress: "Ruby S Snively",
        location: "1460  Jenric Lane, Ashmor Drive ",
        email: "email@g.com",
        phoneNumber: "414-672-5388",
      ),
      const AddressDataContainer(
        userNameForAddress: "Vincent Lobo",
        location: "3068  Woodlawn Drive",
        email: "email@g.com",
        phoneNumber: "414-672-5388",
      ),
    ];
  }

  List<Map<String, String>> paymentIcons = [
    {"Google Pay": "${KIconsPath}GooglePay.svg"},
    {"Phone Pe": "${KIconsPath}PhonePe.svg"},
    {"Paytm": "${KIconsPath}Paytm.svg"}
  ];
  int SelectedPaymentOption = -1;
  @override
  Widget build(BuildContext context) {
    //on tap
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
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10, bottom: 20),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
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
                            separatorBuilder: (context, index) =>
                                const SizedBox(
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

    return SafeArea(
        child: Scaffold(
      appBar: PagesAppBar(
        title: "Payments",
        leadingWidget: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
        child: BottomSheetOptionButtons(btn_text: "Pay Now"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: KPageHorizontalPadding, vertical: 10),
        child: ListView(
          controller: _scrollController,
          children: [
            Mainaddressinfocontainer(
              ChageAddressOnTap: ChageAddressOnTap,
              selectedAddress: selectedAddress,
              selectedUserNameForAddress: selectedUserNameForAddress,
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              color: KGreyBackGroundColor,
              thickness: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  CollapsibleComponent(
                    title: "Debit Card/Credit Card",
                    scrollController: _scrollController,
                    child: Container(),
                    IconDisable: "${KIconsPath}small-plus.svg",
                    IconEnable: "${KIconsPath}small-minus.svg",
                  ),
                  CollapsibleComponent(
                      title: "UPI",
                      scrollController: _scrollController,
                      IconDisable: "${KIconsPath}small-plus.svg",
                      IconEnable: "${KIconsPath}small-minus.svg",
                      child: Container(
                          child: Column(children: [
                        for (var i = 0; i < paymentIcons.length; i++)
                          RadioListTile(
                              activeColor: KPrimaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Row(
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              KBorderRadius),
                                          border: Border.all(
                                              color: KGreyBackGroundColor)),
                                      child: SvgPicture.asset(
                                        paymentIcons[i].values.first,
                                      )),
                                  Text(paymentIcons[i].keys.first),
                                ],
                              ),
                              value: i,
                              groupValue: SelectedPaymentOption,
                              onChanged: (value) {
                                setState(() {
                                  SelectedPaymentOption = value!;
                                  print(
                                      "Selected payment option${SelectedPaymentOption}");
                                });
                              }),
                      ]))),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

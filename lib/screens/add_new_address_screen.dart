import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/components/PagesAppBar.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import '../components/SectionTitle.dart';
import '../components/TitleComponentContainer.dart';

class AddNewAddressScreen extends StatefulWidget {
  static String route = "add-new-address";
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  bool addressCheckboxIsChecked = false;
  @override
  Widget build(BuildContext context) {
    double textFieldHeight = 60;
    return SafeArea(
        child: Scaffold(
      appBar: const PagesAppBar(
        title: "Order Summary",
        leadingWidget: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: BottomSheetOptionButtons(btn_text: "Save Address"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KPageHorizontalPadding,
          ),
          child: ListView(children: [
            TitleComponentContainer(
              children: [
                const SectionTitle(
                  text: 'Contact Information',
                  showView: false,
                  textColor: KGreyColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: KGreyBackGroundColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    SizedBox(
                        height: textFieldHeight,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextFieldComponent(
                                height: textFieldHeight,
                                hintText: "First Name",
                                width: MediaQuery.of(context).size.width *
                                    0.5 *
                                    0.86,
                              ),
                              InputTextFieldComponent(
                                height: textFieldHeight,
                                hintText: "Last Name",
                                width: MediaQuery.of(context).size.width *
                                    0.5 *
                                    0.86,
                              ),
                            ])),
                    const SizedBox(
                      height: 15,
                    ),
                    InputTextFieldComponent(
                      height: textFieldHeight,
                      hintText: "Email",
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(KBorderRadius),
                              color: KGreyBackGroundColor,
                            ),
                            alignment: Alignment.center,
                            child: CountryCodePicker(
                              mode: CountryCodePickerMode.dialog,
                              onChanged: (country) {
                                print('Country code selected: ${country.code}');
                              },
                              initialSelection: 'PS',
                              showFlag: false,
                              showDropDownButton: true,
                              padding: const EdgeInsets.only(top: 0,bottom: 0,left: 10,right: 0),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: InputTextFieldComponent(
                              height: textFieldHeight,
                              hintText: "Contact Number",
                              width:
                                  MediaQuery.of(context).size.width * 0.5 * 0.9,
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            TitleComponentContainer(
              children: [
                const SectionTitle(
                  text: 'Delivery Address',
                  showView: false,
                  textColor: KGreyColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: KGreyBackGroundColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                        height: textFieldHeight,
                        child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "Location",
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(KBorderRadius),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              fillColor: KGreyBackGroundColor,
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: KPrimaryColor,
                          side: const BorderSide(color: KGreyColor),
                          value: addressCheckboxIsChecked,
                          onChanged: (value) {
                            setState(() {
                              addressCheckboxIsChecked = value!;
                            });
                          },
                        ),
                        const Text(
                          "Use as default delivery address.",
                          style: TextStyle(color: KGreyColor),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ])),
    ));
  }
}

class InputTextFieldComponent extends StatefulWidget {
  const InputTextFieldComponent(
      {super.key,
      required this.hintText,
      required this.width,
      required this.height});
  final String hintText;
  final double width;
  final double height;
  @override
  State<InputTextFieldComponent> createState() =>
      _InputTextFieldComponentState();
}

class _InputTextFieldComponentState extends State<InputTextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(KBorderRadius),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            fillColor: KGreyBackGroundColor,
          )),
    );
  }
}

import 'package:ecommerce/Constants/Constant.dart';
import 'package:ecommerce/Constants/ControllerKeys.dart';
import 'package:ecommerce/components/BottomSheetOptionButtons.dart';
import 'package:ecommerce/screens/PagesContainerWithNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../Constants/Colors.dart';
import '../components/InputTextFieldComponent.dart';

class AccountLoginOptionScreen extends StatefulWidget {
  static String route = "signup";
  const AccountLoginOptionScreen({super.key});

  @override
  State<AccountLoginOptionScreen> createState() =>
      _AccountLoginOptionScreenState();
}

class _AccountLoginOptionScreenState extends State<AccountLoginOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 * 0.55,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("${KImagesPath}signup_bg.jpg",
                          fit: BoxFit.cover),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF705C53), Color(0x00705C53)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                child: DefaultTabController(
              length: 2,
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const TabBar(
                        labelColor: KPrimaryColor,
                        dividerColor: KGreyBackGroundColor,
                        indicatorColor: KPrimaryColor,
                        tabs: [
                          Tab(
                            text: "Signup",
                          ),
                          Tab(
                            text: "Login",
                          ),
                        ]),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Form(
                            key: SignUpScreenformKey,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                        horizontal: KPageHorizontalPadding)
                                    .copyWith(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                child: SingleChildScrollView(
                                    physics: const ClampingScrollPhysics(),
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          minHeight: MediaQuery.of(context)
                                              .size
                                              .height,
                                        ),
                                        child: IntrinsicHeight(
                                            child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child:
                                                      InputTextFieldComponent(
                                                    label: "First Name",
                                                    height: 80,
                                                    width: 100,
                                                    hintText: "",
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                    child:
                                                        InputTextFieldComponent(
                                                  label: "Last Name",
                                                  height: 80,
                                                  width: 100,
                                                  hintText: "",
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const InputTextFieldComponent(
                                              label: "Email",
                                              height: 80,
                                              width: 100,
                                              hintText: "",
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const InputTextFieldComponent(
                                              label: "Password",
                                              height: 80,
                                              width: 100,
                                              hintText: "",
                                              secureInput: true,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            BottomSheetOptionButtons(
                                              btn_text: "Create Account",
                                              onTap: () {
                                                if (SignUpScreenformKey
                                                    .currentState!
                                                    .validate()) {
                                                  print("validate");
                                                }
                                                Navigator.pushNamed(
                                                    context,
                                                    PagesContainerWithNavigator
                                                        .route);
                                              },
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      PagesContainerWithNavigator
                                                          .route);
                                                },
                                                child: const Text(
                                                  "Enter as a Guest",
                                                  style: TextStyle(
                                                      color: KPrimaryColor,
                                                      fontSize: 18),
                                                ))
                                          ],
                                        ))))),
                          ),
                          Form(
                            key: LoginScreenformKey,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                        horizontal: KPageHorizontalPadding)
                                    .copyWith(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                child: SingleChildScrollView(
                                    physics: const ClampingScrollPhysics(),
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          minHeight: MediaQuery.of(context)
                                              .size
                                              .height,
                                        ),
                                        child: IntrinsicHeight(
                                            child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const InputTextFieldComponent(
                                              label: "Email",
                                              height: 80,
                                              width: 100,
                                              hintText: "",
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const InputTextFieldComponent(
                                              label: "Password",
                                              height: 80,
                                              width: 100,
                                              hintText: "",
                                              secureInput: true,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            BottomSheetOptionButtons(
                                              btn_text: "Login",
                                              onTap: () {
                                                if (LoginScreenformKey
                                                    .currentState!
                                                    .validate()) {
                                                  print("validate");
                                                }
                                                Navigator.pushNamed(
                                                    context,
                                                    PagesContainerWithNavigator
                                                        .route);
                                              },
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      PagesContainerWithNavigator
                                                          .route);
                                                },
                                                child: const Text(
                                                  "Enter as a Guest",
                                                  style: TextStyle(
                                                      color: KPrimaryColor,
                                                      fontSize: 18),
                                                ))
                                          ],
                                        ))))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}

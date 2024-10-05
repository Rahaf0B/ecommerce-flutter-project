import 'package:ecommerce/screens/login/mobile/widgets/donot_have_account_text.dart';
import 'package:ecommerce/screens/login/mobile/widgets/text_login_form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/TextStyle.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/spacing.dart';
import '../../../widgets/shared/text_btn_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String appBarTitle = "Create Account";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70.h),
        padding: EdgeInsets.symmetric(
            horizontal: SpacingManager.pageHorizontalPadding),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyleTheme.text24Bold,
              ),
              SpacingManager.verticalSpace(25.h),
              TextLoginFormInputField(formKey: formKey),
              SpacingManager.verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember Me",
                    style: TextStyleTheme.text13Regular,
                  ),
                  Checkbox(
                      activeColor: ColorsTheme.primaryColor,
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      })
                ],
              ),
              SpacingManager.verticalSpace(40.h),
              TextButtonComponent(
                height: 60,
                width: 1.sw,
                title: "Login",
                backgroundColor: ColorsTheme.primaryColor,
                textStyle: TextStyleTheme.text15Bold.copyWith(
                  color: ColorsTheme.whiteColor,
                ),
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                },
                borderRadius: SpacingManager.borderRadius,
                btnHorizontalPadding: 15,
                btnVerticalPadding: 10,
              ),
              SpacingManager.verticalSpace(20.h),
              DonotHaveAccountText(),
              SpacingManager.verticalSpace(15.h),
            ],
          ),
        ),
      ),
    );
  }
}

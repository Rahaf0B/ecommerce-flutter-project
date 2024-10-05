import 'package:ecommerce/core/theming/TextStyle.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/spacing.dart';
import 'package:ecommerce/screens/register/mobile/widgets/have_account_text.dart';
import 'package:ecommerce/screens/register/mobile/widgets/terms_and_conditions.dart';
import 'package:ecommerce/screens/register/mobile/widgets/text_signup_form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/shared/text_btn_component.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String appBarTitle = "Create Account";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "Create Account",
                style: TextStyleTheme.text24Bold,
              ),
              SpacingManager.verticalSpace(25.h),
              TextSignupFormInputField(
                formKey: formKey,
              ),
              SpacingManager.verticalSpace(40.h),
              TextButtonComponent(
                height: 60,
                width: 1.sw,
                title: "Register",
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
              TermsAndConditions(),
              SpacingManager.verticalSpace(20.h),
              HaveAccountText(),
              SpacingManager.verticalSpace(15.h),
            ],
          ),
        ),
      ),
    );
  }
}

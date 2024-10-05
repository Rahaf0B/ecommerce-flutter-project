import 'package:ecommerce/screens/register/mobile/widgets/validate_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/regex_helper.dart';
import '../../../../core/icons/Icons.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../widgets/shared/input_text_form_component.dart';

class TextSignupFormInputField extends StatefulWidget {
  const TextSignupFormInputField({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<TextSignupFormInputField> createState() =>
      _TextSignupFormInputFieldState();
}

class _TextSignupFormInputFieldState extends State<TextSignupFormInputField> {
  bool secureInputPassword = true;
  bool secureInputConfirmPassword = true;

  bool hasLowercase_password = false;
  bool hasUppercase_password = false;
  bool hasSpecialCharacters_password = false;
  bool hasNumber_password = false;
  bool hasMinLength_password = false;

  bool hasLength_firstName = false;
  bool hasNumber_firstName = false;

  bool hasLength_lastName = false;
  bool hasNumber_lastName = false;

  late TextEditingController firstNameTextEditingController;
  late TextEditingController lastNameTextEditingController;
  late TextEditingController emailTextEditingController ;
  late TextEditingController passwordTextEditingController ;
  late TextEditingController confirmPasswordTextEditingController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameTextEditingController =
        TextEditingController();
    lastNameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController =
        TextEditingController();
    setupPasswordControllerListener();
    setupFirstNameControllerListener();
    setupLastNameControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordTextEditingController.addListener(() {
      setState(() {
        hasLowercase_password =
            RegexHelper.hasLowerCase(passwordTextEditingController.text);
        hasUppercase_password =
            RegexHelper.hasUpperCase(passwordTextEditingController.text);
        hasSpecialCharacters_password =
            RegexHelper.hasSpecialCharacter(passwordTextEditingController.text);
        hasNumber_password =
            RegexHelper.hasNumber(passwordTextEditingController.text);
        hasMinLength_password = RegexHelper.hasMinLengthPassword(
            passwordTextEditingController.text);
      });
    });
  }

  void setupFirstNameControllerListener() {


      setState(() {


        firstNameTextEditingController.addListener(() {
          hasLength_firstName =
              RegexHelper.hasLengthName(firstNameTextEditingController.text);
          hasNumber_firstName =
              !RegexHelper.hasNumber(firstNameTextEditingController.text);
      });
    });
  }

  void setupLastNameControllerListener() {
    lastNameTextEditingController.addListener(() {


      setState(() {
        hasLength_lastName =
            RegexHelper.hasLengthName(lastNameTextEditingController.text);
        hasNumber_lastName =
            !RegexHelper.hasNumber(lastNameTextEditingController.text);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputTextFormComponent(
                  controller: firstNameTextEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid name';
                    }
                  },
                  width: 155.w,
                  hintText: "first name",
                  label: "First Name",
                  focusColor: ColorsTheme.primaryColor,
                ),
                InputTextFormComponent(
                  controller: lastNameTextEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid name';
                    }
                  },
                  width: 155.w,
                  hintText: "last name",
                  label: "Last Name",
                  focusColor: ColorsTheme.primaryColor,
                ),
              ],
            ),
            // SpacingManager.verticalSpace(20.h),

            SpacingManager.verticalSpace(20.h),
            InputTextFormComponent(
                controller: emailTextEditingController,
                width: 1.sw,
                hintText: "email",
                label: "Email",
                focusColor: ColorsTheme.primaryColor,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegexHelper.isEmailValid(value)) {
                    return 'Enter a valid email';
                  }
                }),
            SpacingManager.verticalSpace(20.h),
            InputTextFormComponent(
              controller: passwordTextEditingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
              width: 1.sw,
              hintText: "password",
              label: "Password",
              focusColor: ColorsTheme.primaryColor,
              secureInput: secureInputPassword,
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        secureInputPassword = !secureInputPassword;
                      });
                    },
                    child: secureInputPassword
                        ? IconsManager.getIcon(
                            20.w, 20.h, IconsManager.eyeCloseIcon)
                        : IconsManager.getIcon(
                            20.w, 20.h, IconsManager.eyeOpenIcon)),
              ),
            ),
            SpacingManager.verticalSpace(20.h),
            InputTextFormComponent(
              controller: confirmPasswordTextEditingController,
              validator: (value) {

                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }else if(value!=passwordTextEditingController.text){
                  return 'The two passwords must be the same';
                }
              },
              width: 1.sw,
              hintText: "confirm password",
              label: "Confirm Password",
              focusColor: ColorsTheme.primaryColor,
              secureInput: secureInputConfirmPassword,
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        secureInputConfirmPassword =
                            !secureInputConfirmPassword;
                      });
                    },
                    child: secureInputConfirmPassword
                        ? IconsManager.getIcon(
                            20.w, 20.h, IconsManager.eyeCloseIcon)
                        : IconsManager.getIcon(
                            20.w, 20.h, IconsManager.eyeOpenIcon)),
              ),
            ),
            SpacingManager.verticalSpace(20.h),
            ValidateMsg(
              hasLength_firstName: hasLength_firstName,
              hasNumber_firstName: hasNumber_firstName,
              hasLength_lastName: hasLength_lastName,
              hasNumber_lastName: hasNumber_lastName,
              hasLowercase_password: hasLowercase_password,
              hasMinLength_password: hasMinLength_password,
              hasNumber_password: hasNumber_password,
              hasSpecialCharacters_password: hasSpecialCharacters_password,
              hasUppercase_password: hasUppercase_password,
            )
          ],
        ));
  }
}

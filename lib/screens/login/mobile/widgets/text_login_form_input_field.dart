import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/regex_helper.dart';
import '../../../../core/icons/Icons.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../widgets/shared/input_text_form_component.dart';

class TextLoginFormInputField extends StatefulWidget {
  const TextLoginFormInputField({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<TextLoginFormInputField> createState() =>
      _TextLoginFormInputFieldState();
}

class _TextLoginFormInputFieldState extends State<TextLoginFormInputField> {
  bool secureInputPassword = true;

  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ));
  }
}

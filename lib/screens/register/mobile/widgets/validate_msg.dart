import 'package:ecommerce/core/theming/TextStyle.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidateMsg extends StatelessWidget {
  const ValidateMsg(
      {super.key,
      required this.hasLowercase_password,
      required this.hasUppercase_password,
      required this.hasSpecialCharacters_password,
      required this.hasNumber_password,
      required this.hasMinLength_password,
      required this.hasLength_firstName,
      required this.hasNumber_firstName,
      required this.hasLength_lastName,
      required this.hasNumber_lastName});

  final bool hasLowercase_password;
  final bool hasUppercase_password;
  final bool hasSpecialCharacters_password;
  final bool hasNumber_password;
  final bool hasMinLength_password;

  final bool hasLength_firstName;
  final bool hasNumber_firstName;

  final bool hasLength_lastName;
  final bool hasNumber_lastName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValidationMsgContainer(
            text: "The First Name must be between 3 & 10 characters",
            condition: hasLength_firstName),
        ValidationMsgContainer(
          text: "The Last Name must be between 3 & 10 characters",
          condition: hasLength_lastName,
        ),
        ValidationMsgContainer(
          text: "The First Name must be just characters",
          condition: hasNumber_firstName,
        ),
        ValidationMsgContainer(
          text: "The Last Name must be just characters",
          condition: hasNumber_lastName,
        ),
        ValidationMsgContainer(
          text: "The Password must be at least 6 characters",
          condition: hasMinLength_password,
        ),
        ValidationMsgContainer(
          text: "The Password must contain special characters",
          condition: hasSpecialCharacters_password,
        ),
        ValidationMsgContainer(
          text: "The Password must contain upper nad lower characters",
          condition: hasUppercase_password && hasLowercase_password,
        ),
        ValidationMsgContainer(
          text: "The Password must contain numbers",
          condition: hasNumber_password,
        ),
      ],
    );
  }
}

class ValidationMsgContainer extends StatelessWidget {
  const ValidationMsgContainer({
    super.key,
    required this.text,
    required this.condition,
  });

  final String text;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CircleAvatar(
        radius: 3,
        backgroundColor: ColorsTheme.primaryTintColor,
      ),
      SpacingManager.horizontalSpace(5.h),
      Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyleTheme.text10Regular.copyWith(
            decoration: condition ? TextDecoration.lineThrough : null,
            color: condition
                ? ColorsTheme.primaryTintColor
                : ColorsTheme.darkRedColor),
      )
    ]);
  }
}

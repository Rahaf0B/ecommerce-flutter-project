import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/TextStyle.dart';
import '../../../../core/theming/colors.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.center
      ,                child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Have an account?',
            style: TextStyleTheme.text13Regular.copyWith(color: ColorsTheme.primaryTintColor),
          ),
          TextSpan(
            text: ' Login',
            style: TextStyleTheme.text13Bold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {

              },
          ),
        ],
      ),
    ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../../../core/theming/TextStyle.dart';
import '../../../../core/theming/colors.dart';

class DonotHaveAccountText extends StatelessWidget {
  const DonotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyleTheme.text13Regular
                  .copyWith(color: ColorsTheme.primaryTintColor),
            ),
            TextSpan(
              text: ' Sign up',
              style: TextStyleTheme.text13Bold,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theming/TextStyle.dart';
import '../../../../core/theming/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyleTheme.text13Regular.copyWith(color: ColorsTheme.blackColor),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyleTheme.text13Bold.copyWith(color: ColorsTheme.blackColor),
          ),
          TextSpan(
            text: ' and',
            style: TextStyleTheme.text13Regular.copyWith(height: 1.5,color: ColorsTheme.blackColor),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyleTheme.text13Regular.copyWith(color: ColorsTheme.blackColor),
          ),
        ],
      ),
    );
  }
}

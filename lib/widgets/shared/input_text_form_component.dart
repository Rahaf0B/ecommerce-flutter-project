import 'package:ecommerce/core/theming/TextStyle.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextFormComponent extends StatefulWidget {
  const InputTextFormComponent(
      {super.key,
      required this.hintText,
      required this.width,
      this.label,
      this.secureInput,
      this.maxLines,
      this.enableColor,
      this.focusColor,
      this.inputFieldPadding,
      this.suffixIcon,
      required this.validator,
      required this.controller});
  final String hintText;
  final double width;
  final String? label;
  final bool? secureInput;
  final int? maxLines;
  final Color? enableColor;
  final Color? focusColor;
  final double? inputFieldPadding;
  final Widget? suffixIcon;
  final FormFieldValidator validator;
  final TextEditingController controller;
  @override
  State<InputTextFormComponent> createState() => _InputTextFormComponentState();
}

class _InputTextFormComponentState extends State<InputTextFormComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null
            ? const SizedBox()
            : Text(
                widget.label!,
                style: TextStyleTheme.text15Regular.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
        widget.label == null
            ? const SizedBox()
            : SpacingManager.verticalSpace(10),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            maxLines: widget.maxLines ?? 1,
            obscureText:
                widget.secureInput == null ? false : widget.secureInput!,
            enableSuggestions:
                widget.secureInput == null ? true : widget.secureInput!,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: widget.suffixIcon ?? null,
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 50, maxWidth: 50),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SpacingManager.borderRadius),
                  borderSide: BorderSide(
                    color: widget.enableColor ?? Colors.transparent,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SpacingManager.borderRadius),
                  borderSide: BorderSide(
                      color: widget.focusColor ?? Colors.transparent,
                      width: 1.3.w)),
              hintText: widget.hintText,
              hintStyle: TextStyleTheme.text10Regular
                  .copyWith(color: ColorsTheme.blackColor),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SpacingManager.borderRadius),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: ColorsTheme.brightGreyColor,
            ),
          ),
        ),
      ],
    );
    ;
  }
}

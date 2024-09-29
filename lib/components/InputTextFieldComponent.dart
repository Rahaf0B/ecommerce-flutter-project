import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';



class InputTextFieldComponent extends StatefulWidget {
  const InputTextFieldComponent(
      {super.key,
        required this.hintText,
        required this.width,
        required this.height,
        this.label,
        this.secureInput
      });
  final String hintText;
  final double width;
  final double height;
  final String? label;
  final bool? secureInput;
  @override
  State<InputTextFieldComponent> createState() =>
      _InputTextFieldComponentState();
}

class _InputTextFieldComponentState extends State<InputTextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.label==null ?  widget.height : widget.height +7 ,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label==null ? const SizedBox() :
          Text( widget.label!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          widget.label==null ? const SizedBox() : const SizedBox(height: 10,),
          TextFormField(
              maxLines: 1,
              obscureText: widget.secureInput==null ?  false : widget.secureInput!,
              enableSuggestions: widget.secureInput==null ?  true : widget.secureInput!,

              decoration: InputDecoration(

                hintText: widget.hintText,
                hintStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: KGreyBackGroundColor,
              )),
        ],
      ),
    );
  }
}

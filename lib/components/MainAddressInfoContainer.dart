import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';
import 'SectionTitle.dart';
import 'TitleComponentContainer.dart';

class Mainaddressinfocontainer extends StatefulWidget {
  const Mainaddressinfocontainer(
      {super.key,
      required this.selectedAddress,
      required this.selectedUserNameForAddress,
      required this.ChageAddressOnTap});

  final String selectedAddress;
  final String selectedUserNameForAddress;
  final Function ChageAddressOnTap;

  @override
  State<Mainaddressinfocontainer> createState() =>
      _MainaddressinfocontainerState();
}

class _MainaddressinfocontainerState extends State<Mainaddressinfocontainer> {
  @override
  Widget build(BuildContext context) {
    return TitleComponentContainer(children: [
      const SectionTitle(
        title: "Deliver To",
        showView: false,
        textColor: KGreyColor,
        titleFontSize: 18,
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: KGreyBackGroundColor,
            borderRadius: BorderRadius.circular(KBorderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.selectedUserNameForAddress,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: KTextDarkColor, fontSize: 15),
              ),
              Text(widget.selectedAddress,
                  style: const TextStyle(color: KGreyColor, fontSize: 15)),
            ]),
            Container(
                decoration: BoxDecoration(
                    color: KPrimaryColor,
                    borderRadius: BorderRadius.circular(KBorderRadius)),
                child: IconButton(
                    onPressed: () {
                      widget.ChageAddressOnTap();
                    },
                    icon: SvgPicture.asset("${KIconsPath}edit.svg")))
          ],
        ),
      )
    ]);
  }
}

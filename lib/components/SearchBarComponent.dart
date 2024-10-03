import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class SearchBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarComponent({super.key, required this.toggleComponent});

  final VoidCallback toggleComponent;

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final double iconSize = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: KPageHorizontalPadding),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    widget.toggleComponent();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: iconSize,
                  )),
            ),
          ),
          Flexible(
            flex: 7,
            child: SearchBar(
              backgroundColor: WidgetStateProperty.all(KGreyBackGroundColor),
              hintText: "Search",
              elevation: const WidgetStatePropertyAll(0),
              trailing: const [
                Icon(
                  Icons.search,
                  size: 30,
                )
              ],
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(KBorderRadius))),
              constraints: const BoxConstraints(minHeight: 50),
            ),
          )
        ],
      ),
    );
  }
}

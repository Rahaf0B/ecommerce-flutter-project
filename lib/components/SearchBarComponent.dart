import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class SearchBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarComponent({super.key});

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: KPageHorizontalPadding),
      height: 100,
      // color: KPageBackGroundColor,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 30,
                )),
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

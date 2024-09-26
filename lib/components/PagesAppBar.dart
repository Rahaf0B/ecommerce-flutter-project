import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class PagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PagesAppBar(
      {super.key,
      this.scaffoldKey,
      this.title,
      this.leadingWidget,
      this.actionsWidgets});

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String? title;
  final Widget? leadingWidget;
  final List<Widget>? actionsWidgets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPageHorizontalPadding),
      child: AppBar(
        title: Text(
          title ?? "",
          style: const TextStyle(
              fontFamily: KTextFont, fontSize: 24, color: KPrimaryColor),
        ),
        actions: actionsWidgets,
        leading: leadingWidget,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

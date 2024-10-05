import 'package:ecommerce/core/theming/TextStyle.dart';
import 'package:ecommerce/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreensAppBar(
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
      padding: EdgeInsets.symmetric(
          horizontal: SpacingManager.pageHorizontalPadding),
      child: AppBar(
        title: Text(
          title ?? "",
          style: TextStyleTheme.text22Regular,
        ),
        leadingWidth: 50.w,
        actions: actionsWidgets,
        leading: leadingWidget,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SpacingManager.mobileAppBarHeight);
}

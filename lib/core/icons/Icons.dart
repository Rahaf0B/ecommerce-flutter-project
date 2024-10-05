import 'package:ecommerce/core/config/pathsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconsManager {
  static const String arrowLeftIcon = "${PathsManager.iconsPath}arrowleft.svg";
  static const String arrowRightIcon = "${PathsManager.iconsPath}arrowleft.svg";
  static const String arrowUpIcon = "${PathsManager.iconsPath}arrowleft.svg";
  static const String arrowDownIcon = "${PathsManager.iconsPath}arrowleft.svg";

  static const String eyeCloseIcon =
      "${PathsManager.iconsPath}eyeCloseIcon.svg";

  static const String eyeOpenIcon = "${PathsManager.iconsPath}eyeOpenIcon.svg";

  static getIcon(double width, double height, String iconName) =>
      SvgPicture.asset(
        iconName,
        height: height,
        width: width,
      );
}

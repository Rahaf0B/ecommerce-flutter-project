import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "Colors.dart";

const KTextFooterMainTitleStyle =
    TextStyle(color: KBrightColor, fontSize: 14, fontWeight: FontWeight.w500);
TextStyle KTextFooterSubTitleStyle =
    TextStyle(color: KSubTextColor, fontSize: 20);

// product card info style

TextStyle productSubInfoTitleStyleCard = TextStyle(
    fontSize: 4.sp, color: KTextDarkColor, fontWeight: FontWeight.bold);
TextStyle productSubInfoSubTitleStyleCard =
    TextStyle(fontSize: 4.sp, color: KTextDarkColor);
TextStyle productSubInfoPriceStyleCard = TextStyle(
    fontSize: 4.sp, color: KTextDarkColor, fontWeight: FontWeight.bold);
TextStyle productSubInfoSubPriceStyleCard = TextStyle(
  fontSize: 4.sp,
  color: KSubTextColor,
  decoration: TextDecoration.lineThrough,
  decorationColor: KSubTextColor,
);
TextStyle productSubInfoDiscountStyleCard =
    TextStyle(fontSize: 4.sp, color: KRedColor);

// product page info style
TextStyle productSubInfoTitleStylePage = TextStyle(
    fontSize: 20.sp,
    color: KTextDarkColor,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis);
TextStyle productSubInfoSubTitleStylePage = TextStyle(
    fontSize: 15.sp, color: KTextDarkColor, overflow: TextOverflow.ellipsis);
TextStyle productSubInfoPriceStylePage = TextStyle(
    fontSize: 4.sp, color: KTextDarkColor, fontWeight: FontWeight.bold);
TextStyle productSubInfoSubPriceStylePage = TextStyle(
  fontSize: 4.sp,
  color: KSubTextColor,
  decoration: TextDecoration.lineThrough,
  decorationColor: KSubTextColor,
);
TextStyle productSubInfoDiscountStylePage =
    TextStyle(fontSize: 4.sp, color: KRedColor);
const ratingLabelStyle =
    TextStyle(fontWeight: FontWeight.w400, color: KGreyColor);

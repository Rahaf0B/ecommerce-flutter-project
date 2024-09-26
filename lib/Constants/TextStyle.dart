import "package:flutter/material.dart";

import "Colors.dart";

const KTextFooterMainTitleStyle = TextStyle(
    color: KBrightColor, fontSize: 14, fontWeight: FontWeight.w500);
const KTextFooterSubTitleStyle = TextStyle(color: KSubTextColor, fontSize: 14);

// product card info style

const productSubInfoTitleStyleCard =
    TextStyle(fontSize: 15, color: KTextDarkColor, fontWeight: FontWeight.bold);
const productSubInfoSubTitleStyleCard =
    TextStyle(fontSize: 12, color: KTextDarkColor);
const productSubInfoPriceStyleCard =
    TextStyle(fontSize: 15, color: KTextDarkColor, fontWeight: FontWeight.bold);
const productSubInfoSubPriceStyleCard = TextStyle(
  fontSize: 12,
  color: KSubTextColor,
  decoration: TextDecoration.lineThrough,
  decorationColor: KSubTextColor,
);
const productSubInfoDiscountStyleCard =
    TextStyle(fontSize: 12, color: KRedColor);

// product page info style
const productSubInfoTitleStylePage = TextStyle(
    fontSize: 20,
    color: KTextDarkColor,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis);
const productSubInfoSubTitleStylePage = TextStyle(
    fontSize: 15, color: KTextDarkColor, overflow: TextOverflow.ellipsis);
const productSubInfoPriceStylePage =
    TextStyle(fontSize: 24, color: KTextDarkColor, fontWeight: FontWeight.bold);
const productSubInfoSubPriceStylePage = TextStyle(
  fontSize: 15,
  color: KSubTextColor,
  decoration: TextDecoration.lineThrough,
  decorationColor: KSubTextColor,
);
const productSubInfoDiscountStylePage =
    TextStyle(fontSize: 15, color: KRedColor);
const ratingLabelStyle =
    TextStyle(fontWeight: FontWeight.w400, color: KGreyColor);

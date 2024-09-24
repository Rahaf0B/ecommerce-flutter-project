import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Constant.dart';
import 'TextStyle.dart';

List<Widget> shopCategory = [
  Text(
    "Skincare",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Prsonal Care",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Handbags",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Apparels",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Watches",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Eye Wear",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Jewellery",
    style: KTextFooterSubTitleStyle,
  ),
];

List<Widget> policy = [
  Text(
    "Return",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Terms of use",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Sitemap",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Security",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Privacy",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "EPR Compliance",
    style: KTextFooterSubTitleStyle,
  ),
];

List<Widget> about = [
  Text(
    "Contact Us",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "About Us",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Careers",
    style: KTextFooterSubTitleStyle,
  ),
  Text(
    "Press",
    style: KTextFooterSubTitleStyle,
  ),
];


List<Widget> socialContact= [
  IconButton(
    onPressed: () {},
    icon: SvgPicture.asset(KIconsPath + "fblogo.svg",
        width: 38)),
    IconButton(
onPressed: () {},
icon: SvgPicture.asset(KIconsPath + "instalogo.svg",
width: 38)),
IconButton(
onPressed: () {},
icon: SvgPicture.asset(KIconsPath + "twitter.svg",
width: 38)),
IconButton(
onPressed: () {},
icon: SvgPicture.asset(KIconsPath + "youtube.svg",
width: 38))
];

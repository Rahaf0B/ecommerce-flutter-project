import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Constant.dart';
import 'TextStyle.dart';

List<Widget> shopCategory = [
  const Text(
    "Skincare",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Prsonal Care",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Handbags",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Apparels",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Watches",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Eye Wear",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Jewellery",
    style: KTextFooterSubTitleStyle,
  ),
];

List<Widget> policy = [
  const Text(
    "Return",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Terms of use",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Sitemap",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Security",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Privacy",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "EPR Compliance",
    style: KTextFooterSubTitleStyle,
  ),
];

List<Widget> about = [
  const Text(
    "Contact Us",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "About Us",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Careers",
    style: KTextFooterSubTitleStyle,
  ),
  const Text(
    "Press",
    style: KTextFooterSubTitleStyle,
  ),
];


List<Widget> socialContact= [
  IconButton(
    onPressed: () {},
    icon: SvgPicture.asset("${KIconsPath}fblogo.svg",
        width: 38)),
    IconButton(
onPressed: () {},
icon: SvgPicture.asset("${KIconsPath}instalogo.svg",
width: 38)),
IconButton(
onPressed: () {},
icon: SvgPicture.asset("${KIconsPath}twitter.svg",
width: 38)),
IconButton(
onPressed: () {},
icon: SvgPicture.asset("${KIconsPath}youtube.svg",
width: 38))
];

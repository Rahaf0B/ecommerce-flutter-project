import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({super.key, required this.text});
  final String text;
  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KBorderRadius),
          color: KGreyBackGroundColor),
      padding: const EdgeInsets.all(12),
      child: Text(
        widget.text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: KTextDarkColor, fontSize: 14),
      ),
    );
  }
}

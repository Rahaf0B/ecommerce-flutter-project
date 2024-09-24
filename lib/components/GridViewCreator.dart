import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Gridviewcreator extends StatelessWidget {
  const Gridviewcreator(
      {Key? key,
      required this.children,
      this.height,
      required this.numberOfColumns,
      required this.numberOfRows})
      : super(key: key);
  final double? height;
  final List<Widget> children;
  final int numberOfColumns;
  final int numberOfRows;

  @override
  Widget build(BuildContext context) {
    final rowSizes = [for (var i = 0; i < numberOfRows; i++) auto];
    final columnSizes = [for (var i = 0; i < numberOfColumns; i++) 1.fr];
    return Container(
        constraints: BoxConstraints(maxHeight: height ?? double.infinity),
        color: Colors.transparent,
        child: LayoutGrid(
            columnSizes: columnSizes,
            rowSizes: rowSizes,
            columnGap: 16,
            rowGap: 16,
            children: children));
  }
}

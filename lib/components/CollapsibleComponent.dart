import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class CollapsibleComponent extends StatefulWidget {
  const CollapsibleComponent({
    super.key,
    required this.title,
    required this.scrollController,
    required this.child,
    this.IconDisable,
    this.IconEnable,
  });
  final ScrollController scrollController;
  final Widget child;
  final String title;
  final String? IconDisable;
  final String? IconEnable;

  @override
  State<CollapsibleComponent> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<CollapsibleComponent> {
  bool showChildComponent = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: showChildComponent ? 680 : 60),
      padding: const EdgeInsets.all(0),
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: KPageHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          color: KTextDarkColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (!showChildComponent) {
                          widget.scrollController.jumpTo(
                              widget.scrollController.position.pixels + 50.0);
                        }

                        setState(() {
                          showChildComponent = !showChildComponent;
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: SvgPicture.asset(showChildComponent
                          ? (widget.IconEnable == null
                              ? "${KIconsPath}arrowup.svg"
                              : widget.IconEnable!)
                          : (widget.IconDisable == null
                              ? "${KIconsPath}arrowDown.svg"
                              : widget.IconDisable!)))
                ],
              ),
            ),
            showChildComponent
                ? Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: widget.child)
                : Container(
                    height: 0,
                  ),
          ]),
    );
  }
}

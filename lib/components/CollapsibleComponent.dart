import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constants/Colors.dart';
import '../Constants/Constant.dart';

class CollapsibleComponent extends StatefulWidget {
  const CollapsibleComponent({
    Key? key,
    required this.title,
    required this.scrollController,
    required this.child,
  }) : super(key: key);
  final ScrollController scrollController;
  final Widget child;
  final String title;

  @override
  State<CollapsibleComponent> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<CollapsibleComponent> {
  bool showChildComponent = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: showChildComponent ? 680 : 60),
      padding: EdgeInsets.all(0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
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
                      ? KIconsPath + "arrowup.svg"
                      : KIconsPath + "arrowDown.svg"))
            ],
          ),
        ),
        showChildComponent
            ? Flexible(
                child: widget.child,
              )
            : Container(
                height: 0,
              ),
      ]),
    );
  }
}

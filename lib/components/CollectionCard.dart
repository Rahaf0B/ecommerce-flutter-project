import 'package:flutter/material.dart';
import '../Constants/Constant.dart';

class Collectioncard extends StatefulWidget {
  const Collectioncard(
      {super.key, required this.title, required this.img_url, this.onTap});
  final String img_url;
  final String title;
  final Function? onTap;
  @override
  State<Collectioncard> createState() => _CollectioncardState();
}

class _CollectioncardState extends State<Collectioncard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: widget.onTap == null
            ? () {}
            : () {
                widget.onTap!();
              },
        child: SizedBox(
          child: Card(
            margin: EdgeInsets.all(0),
            color: Colors.transparent,
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  child: Image.asset(
                    widget.img_url,
                  )),
              Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  height: double.infinity,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  alignment: Alignment.bottomLeft)
            ]),
          ),
        ),
      ),
    );
  }
}

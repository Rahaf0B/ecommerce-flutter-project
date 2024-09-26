import 'package:flutter/material.dart';
import '../Constants/Constant.dart';

class Collectioncard extends StatefulWidget {
  const Collectioncard(
      {super.key,
      required this.title,
      required this.img_url,
      this.onTap,
      required this.id});
  final String img_url;
  final String title;
  final Function? onTap;
  final int id;
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
            margin: const EdgeInsets.all(0),
            color: Colors.transparent,
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(KBorderRadius),
                  child: Image.asset(
                    widget.img_url,
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  height: double.infinity,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

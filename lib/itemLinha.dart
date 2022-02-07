import 'package:flutter/material.dart';

class ItemLinha extends StatelessWidget {
  final String item;
  const ItemLinha({
    Key key,
    this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, top: 5),
          child: Text(this.item, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
        )
      ],
    );
  }
}
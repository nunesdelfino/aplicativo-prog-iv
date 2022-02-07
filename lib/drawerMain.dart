
import 'package:flutter/material.dart';

class DrawerMain extends Drawer {
  @override
  Widget build(BuildContext context){
    return Drawer (
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(child: Text("Menu Principal", style: TextStyle(fontSize: 20.0),)),
            decoration: BoxDecoration(color: Colors.lightGreen),
            ),
            ListTile(
              title: Text("Item 01"),
            ),
            ListTile(
              title: Text("Item 02"),
            ),
            ListTile(
              title: Text("Item 03"),
            ),
            ListTile(
              title: Text("Item 04"),
            ),
        ],
      ),
    );
  }
}
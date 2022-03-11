import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drawerMain.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final ApiService api = ApiService();
  // List<Pedido> pedidosList;

  @override
  Widget build(BuildContext context) {
    // if(pedidosList == null) {
    //   pedidosList = [];
    // }

    return Scaffold(
      drawer: DrawerMain(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Tela principal"
          ),
        )
      ),
    );
  }
}


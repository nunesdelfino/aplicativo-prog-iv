import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drawerMain.dart';
import 'pedidoList.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  List<Pedido> pedidosList;

  @override
  Widget build(BuildContext context) {
    if(pedidosList == null) {
      pedidosList = [];
    }

    return Scaffold(
      drawer: DrawerMain(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child:GestureDetector(
              onTap: (){
                setState(() {
                  this.pedidosList = pedidosList;     
                });
              },
              child: Icon(
                Icons.refresh
              ),
            ),
          )
        ]
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              print("future");
              return pedidosList.length > 0
              ? PedidosList(pedido: pedidosList)
              : Center(
                child: Text("Sem dados",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }
          ),
        )
      ),
    );
  }

  Future loadList() {
    Future<List<Pedido>> futurePedidos = api.getPedidos();
    futurePedidos.then((pedidosList) {
      // setState(() {
              this.pedidosList = pedidosList;
            // });
    });
    return futurePedidos;
  }
}


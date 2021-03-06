import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/pedidoTeste.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drawerMain.dart';
import 'pedidoList.dart';

class  PeginaPedido extends StatefulWidget {
  PeginaPedido({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PeginaPedidoState createState() => _PeginaPedidoState();
}

class _PeginaPedidoState extends State<PeginaPedido> {
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
              ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: PedidosTeste(pedido: pedidosList, loadListSetState: loadListSetState)
                  )
                )
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

  Future loadListSetState() {
    Future<List<Pedido>> futurePedidos = api.getPedidos();
    futurePedidos.then((pedidosList) {
      setState(() {
              this.pedidosList = pedidosList;
      });
    });
    return futurePedidos;
  }
}


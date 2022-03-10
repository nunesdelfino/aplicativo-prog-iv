import 'package:fabricadechocolate/barra_busca.dart';
import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/pedidoTeste.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drawerMain.dart';
import 'pedidoList.dart';

class PaginaPesquisa extends StatefulWidget {
  PaginaPesquisa({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaginaPesquisaState createState() => _PaginaPesquisaState();
}

class _PaginaPesquisaState extends State<PaginaPesquisa> {
  final ApiService api = ApiService();
  Pedido pedido;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      drawer: DrawerMain(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child:GestureDetector(
              onTap: (){
                //setState(() {
                  //this.pedidosList = pedidosList;     
                //});
              },
              child: Icon(
                Icons.refresh
              ),
            ),
          )
        ]
      ),
      body: Card(
        child:  ListView(
          children:[
            BarraBusca(),
          //  Pedido Item(
          //     item: "Id:" + item.id + "|" +
          //     "Nome: " + item.no

            //)
          ],
        )
      ),
    );
  }

 
  Future loadListSetState(Future f) {
    Future<Pedido> futurePedidos = f;
    futurePedidos.then((pedido) {
      setState(() {
        this.pedido = pedido;
      });
    });
    return futurePedidos;
  }
}


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
  Pedido pedido = new Pedido(id: 0);
  
  TextEditingController control;

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
        child:  Column(
          children:[
            BarraBusca(pesquisar: Pesquisa),
            FutureBuilder(
              future: loadList(),
              builder: (context, snapshot){
                print("teste");
                return pedido != null? Container(
                  child: Text(pedido.nome)
                ): Center(
                  child: Text("Sem dados",
                  style: Theme.of(context).textTheme.bodyText1)
                );
              }
            ),

            // Pedido Item(
            //    item: "Id:" + item.id + "|" +
            //    "Nome: " + item.no
            //)
          ],
        )
      ),
    );
  }

 //quando pesquisa chama o loadList de novo e quando chama gera erro.
  Future loadList(){
    Future<Pedido> futurePedidos = api.getById();
    futurePedidos.then((pedido) {
        this.pedido = pedido;
    });
    return futurePedidos; 
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

  Pesquisa(TextEditingController myController){
    Future p;
    p = api.getById(myController.text);
    loadListSetState(p);
  }

}


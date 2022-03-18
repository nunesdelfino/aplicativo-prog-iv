import 'package:fabricadechocolate/entregalist.dart';
import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';

import 'drawerMain.dart';
import 'entreguelist.dart';

class PaginaEntrega extends StatefulWidget {
  PaginaEntrega({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaginaEntregaState createState() => _PaginaEntregaState();
}

class _PaginaEntregaState extends State<PaginaEntrega> {
  final ApiService api = ApiService();
  List<Pedido> entregaList;
  List<Pedido> entregueList;

  @override
  Widget build(BuildContext context) {
    if (entregaList == null) {
      entregaList = [];
    }
    if (entregueList == null) {
      entregueList = [];
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: DrawerMain(),
            appBar: AppBar(
              title: Text(widget.title),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      loadList();
                    },
                    child: Icon(Icons.refresh),
                  ),
                )
              ],
              bottom: TabBar(
                indicatorColor: Colors.yellow.shade200,
                tabs: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.library_books),
                      Text("   Entregas Pendentes")
                    ],
                  ), //Entregas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.history),
                      Text("   Histórico")
                    ],
                  ), //O que já foi entregue
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                FutureBuilder(
                    future: loadListEntrega(),
                    builder: (context, snapshot) {
                      print("feature builder");
                      print(snapshot.connectionState);

                      return entregaList.length > 0
                          ? SingleChildScrollView(
                              child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: EntregaList(
                                      entregas: entregaList,
                                      loadListSetState: loadList)))
                          : Center(
                              child: Text(
                                "Sem dados",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            );
                    }

                    //  return entregaList.length > 0
                    //      ? new EntregaList(
                    //          //criar classe com o nome
                    //          entregas: entregaList)//,funcao: _getData())
                    //      : new Center(
                    //          child: new Text("Nenhum registro encontrado!",
                    //              style:
                    //                  Theme.of(context).textTheme.headline6)

                    ),
                FutureBuilder(
                    future: loadListEntregues(),
                    builder: (context, snapshot) {
                      print("feature builder");
                      print(snapshot.connectionState);

                      return entregueList.length > 0
                          ? SingleChildScrollView(
                              child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: EntregueList(
                                    entregas: entregueList,
                                    loadListSetState: loadList,
                                  )))
                          : Center(
                              child: Text(
                                "Sem dados",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            );
                    }), /*FutureBuilder(
                    future: loadListEntregues(),
                    builder: (context, snapshot) {
                      return entregueList.length > 0
                          ? new EntregueList(
                              entregas:
                                  entregueList) //entregas eh a variavel da outra classe
                          : new Center(
                              child: new Text("Nenhum registro encontrado!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6)); //Center
                    })*/
              ],
            )));
  }

  Future<List<Pedido>> loadListEntrega() {
    //async
    print("loadListEntrega");
    Future<List<Pedido>> futureEntregas = api.entregar();
    futureEntregas.then((entregaList) {
      this.entregaList = entregaList;
    });
    return futureEntregas;
  }

//Adicionado 15/02/2022
  Future<List<Pedido>> loadListEntregues() {
    //async
    print("loadListEntregues");
    Future<List<Pedido>> futureEntregues = api.entregue();
    futureEntregues.then((entregueList) {
      this.entregueList = entregueList;
    });
    return futureEntregues;
  }

//Dois SetState
  loadList() {
    setState(() {
      loadListEntrega();
      //Adicionado 15/02/2022
      loadListEntregues();
    });
  }

  @override
  Future<void> initState() {
    //async
    super.initState();
    loadListEntrega();
    //Adicionado 15/02/2022
    loadListEntregues();
  }
}

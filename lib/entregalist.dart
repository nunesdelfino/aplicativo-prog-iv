// ignore_for_file: must_be_immutable

import 'package:fabricadechocolate/itemList.dart';
import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';

import 'itemLinha.dart';

const IconData local_shipping = IconData(0xe3a6, fontFamily: 'MaterialIcons');
const IconData caderno = IconData(0xf0311, fontFamily: 'MaterialIcons');

class EntregaList extends StatefulWidget {
  final List<Pedido> entregas;
  final Function loadListSetState;
  ApiService api = new ApiService();

  EntregaList({Key key, this.entregas, this.loadListSetState})
      : super(key: key);

  String status;

  @override
  _EntregaListState createState() => _EntregaListState();
}

class _EntregaListState extends State<EntregaList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.entregas[index].isExpanded = !isExpanded;
        });
      },
      children: widget.entregas.map<ExpansionPanel>((Pedido item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
                title: Text(item.id.toString() +
                    " - " +
                    item.nome +
                    " - " +
                    contato(item.contato)));
          },
          body: Card(
              child: InkWell(
                  child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  // ItemLinha(
                  //     item: "Tipo : " +
                  //         captalizar(item.tipoOvo) +
                  //         " === " +
                  //         "Tamanho : " +
                  //         (item.tamanho).toString() +
                  //         " g === " +
                  //         "Preço : " +
                  //         stringNull(item.preco.toString())),
                  // ItemLinha(item: "Sabores : " + sabores(item)),
                  // ItemLinha(
                  //     item: "Entregar : " +
                  //         (item.entregar) +
                  //         " -- " +
                  //         "Data : " +
                  //         dataPedido(item.dataEntrega)),
                  // ItemLinha(item: "Endereço : " + stringNull(item.endereco)),
                  // ItemLinha(item: "Obs : " + stringNull(item.observacao)),
                  ItemList(item: item),
                  SizedBox(height: 5),
                  Container(
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.local_shipping, size: 30),
                        onPressed: () {
                          _onClickDialog(context, item);
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ))),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  String captalizar(String s) {
    List<String> l = s.split("");
    l[0] = l[0].toUpperCase();

    return l.join();
  }

  String stringNull(String s) {
    if (s != null && s != "null") {
      return s;
    } else {
      return "";
    }
  }

  String contato(String s) {
    List<String> ls = s.split("");

    String c = "(" +
        ls[0] +
        ls[1] +
        ") " +
        ls[2] +
        ls[3] +
        ls[4] +
        ls[5] +
        " - " +
        ls[6] +
        ls[7] +
        ls[8] +
        ls[9];

    return c;
  }

  String sabores(Pedido p) {
    String sabores = p.saborUm;

    if (p.saborDois != null) {
      sabores += " - " + p.saborDois;
    }

    if (p.saborTres != null) {
      sabores += " - " + p.saborTres;
    }

    if (p.saborQuatro != null) {
      sabores += " - " + p.saborQuatro;
    }

    if (p.saborCinco != null) {
      sabores += " - " + p.saborCinco;
    }

    return sabores.toString();
  }

  String dataPedido(String data) {
    List<String> d;
    d = data.split("-");
    return d[2] + "/" + d[1] + "/" + d[0];
  }

  _onClickDialog(BuildContext context, Pedido entregas) {
    final ApiService api = ApiService();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Deseja marcar o pedido (" +
                entregas.id.toString() +
                "):" +
                "\n\n" +
                "Cliente: " +
                entregas.nome +
                "\nTel: " +
                entregas.contato +
                "\n\nComo entregue?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.pop(context);
                  api.updateEntregas(entregas.id);
                  widget.loadListSetState();
                },
              )
            ],
          ),
        );
      },
    );
  }
}

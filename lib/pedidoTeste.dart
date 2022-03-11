import 'package:fabricadechocolate/itemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'botoesAcoes.dart';
import 'itemLinha.dart';
import 'models/pedido.dart';

// ignore: must_be_immutable
class PedidosTeste extends StatefulWidget {

  final List<Pedido> pedido;
  final Function loadListSetState;
  PedidosTeste({Key key, this.pedido, this.loadListSetState}) : super(key: key);

  String status;

  @override
  _PedidosTesteState createState() => _PedidosTesteState();

}

class _PedidosTesteState extends State<PedidosTeste> {

  Widget build(BuildContext context) {
    return
      ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            widget.pedido[index].isExpanded = !isExpanded;
          });
        },
        children: widget.pedido.map<ExpansionPanel>((Pedido item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.id.toString() + " - " + item.nome + " - " + contato(item.contato) + " - " + captalizar(statusPedido(item.status))),
              );
            },
            body: ItemList(loadListSetState: widget.loadListSetState, item: item),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      );
  }

  String captalizar(String s){
    List<String> l = s.split("");
     l[0] = l[0].toUpperCase();
    
    return l.join();
  }

  String stringNull(String s){
    if(s != null && s != "null"){
      return s;
    } else {
      return "";
    }
  }

  String contato(String s){
    List<String> ls = s.split("");

    String c = "(" + ls[0] + ls[1] + ") " + ls[2] + ls[3] + ls[4] + ls[5] + " - " + ls[6] + ls[7] + ls[8] + ls[9]; 

    return c;
  }

  String sabores(Pedido p){
    String sabores = p.saborUm;

    if(p.saborDois != null){
      sabores += " - " + p.saborDois;
    }

    if(p.saborTres != null){
      sabores += " - " + p.saborTres;
    }

    if(p.saborQuatro != null){
      sabores += " - " + p.saborQuatro;
    }

    if(p.saborCinco != null){
      sabores += " - " + p.saborCinco;
    }

    return sabores.toString();
  }

  String dataPedido(String data){
    List<String> d;
    d = data.split("-");
    return d[2] + "/" + d[1] + "/" + d[0];
  }

  String statusPedido(String statusRecebido){
    if(statusRecebido == "aceitonpg"){
      return "Aceito - Não Pago";
    }
    if(statusRecebido == "aceitopg"){
      return "Aceito - Pago";
    }
    return statusRecebido;
  }

}
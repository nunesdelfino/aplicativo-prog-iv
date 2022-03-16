import 'package:fabricadechocolate/botoesAcoes.dart';
import 'package:flutter/material.dart';

import 'models/pedido.dart';

class ItemList extends StatelessWidget {
  final Pedido item;
  final loadListSetState;
  const ItemList({
    Key key,
    this.item, this.loadListSetState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          onTap: () {
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(verificaImagem(item.tipoOvo), height: 70.0,),
                          SizedBox(height: 7),
                          Text(item.tamanho + " g", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15))
                        ],
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sabores: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                          SizedBox(height: 3),
                          Text(sabores(item)),
                          SizedBox(height: 3),
                          Text("Endereço: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                          Text(stringNull(item.endereco)),
                          SizedBox(height: 3),
                          Text("OBS: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                          Text(stringNull(item.observacao)),
                        ],
                      ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.95, 0),
                            child: Text("R\u0024" + stringNull(item.preco.toString()), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                          ),
                          SizedBox(height: 40),
                          Text(dataPedido(item.dataEntrega)),
                          SizedBox(height: 20),
                          Text(("Entregar: " + captalizar(item.entregar))),
                        ]
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.black,),
                ],
              )
            ],
          )
        )
    );
  }

  String verificaImagem(String s) {
    if(s.toLowerCase().compareTo('colher') == 0){
      return 'images/colher.png';
    }

    if(s.toLowerCase().compareTo('trufado') == 0){
      return 'images/trufado.png';
    }

    return 'images/simples.png';
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
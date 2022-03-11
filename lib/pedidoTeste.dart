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
            body: Card(
                  child: InkWell(
                    onTap: () {
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            // ItemLinha(item: "Tipo : " + captalizar(item.tipoOvo)),
                            // ItemLinha(item: "Tamanho : " + (item.tamanho).toString() + " g",),
                            // ItemLinha(item: "Preço : " + stringNull(item.preco.toString())),
                            // ItemLinha(item: "Sabores : " + sabores(item)),
                            // ItemLinha(item: "Entregar : " + (item.entregar)),
                            // ItemLinha(item: "Data : " + dataPedido(item.dataEntrega)),
                            // ItemLinha(item: "Endereço : " + stringNull(item.endereco)),
                            // ItemLinha(item: "Obs : " + stringNull(item.observacao)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset('images/colher.png', height: 70.0,),
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
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        
                                        child: Text("R\u0024" + stringNull(item.preco.toString())),
                                      ),
                                      Container(
                                        child: Text(dataPedido(item.dataEntrega)),
                                      ),
                                      Container(
                                        child: Text((item.entregar)),
                                      ),
                                    ]
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: Colors.black,),
                            LinhaBotoes(botaoUm: "Aceito - Não Pago", botaoDois: "Aceito - Pago", botaoTres: "Cancelar", id: item.id, fun: widget.loadListSetState),
                            SizedBox(height: 5),
                          ],
                        )
                      ],
                    )
                  )
              ),
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
import 'package:flutter/material.dart';

import 'models/pedido.dart';

// ignore: must_be_immutable
class PedidosTeste extends StatelessWidget {

  final List<Pedido> pedido;
  final Function loadListSetState;
  PedidosTeste({Key key, this.pedido, this.loadListSetState}) : super(key: key);

  String status;

  @override
  Widget build(BuildContext context) {
    return
      // ListView.builder(
      //     itemCount: pedido == null ? 0 : pedido.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return
      //         Card(
      //             child: InkWell(
      //               onTap: () {
      //               },
      //               child: ListView(
      //                 shrinkWrap: true,
      //                 children: [
      //                   Column(
      //                     children: [
      //                       ItemLinha(item: "Nº Pedido : " + (pedido[index].id).toString()),
      //                       ItemLinha(item: "Nome : " + pedido[index].nome),
      //                       ItemLinha(item: "Contato : " + contato(pedido[index].contato)),
      //                       ItemLinha(item: "Status: " + statusPedido((pedido[index].status)).toUpperCase()),
      //                       ItemLinha(item: "Tipo : " + (pedido[index].tipoOvo).toUpperCase()),
      //                       ItemLinha(item: "Sabores : " + sabores(pedido[index])),
      //                       ItemLinha(item: "Tamanho : " + (pedido[index].tamanho).toString() + " g"),
      //                       ItemLinha(item: "Preço : " + (pedido[index].preco.toString())),
      //                       ItemLinha(item: "Data : " + dataPedido(pedido[index].dataEntrega)),
      //                       ItemLinha(item: "Entregar : " + (pedido[index].entregar)),
      //                       ItemLinha(item: "Endereço : " + stringNull(pedido[index].endereco)),
      //                       ItemLinha(item: "Obs : " + stringNull(pedido[index].observacao)),
      //                       SizedBox(height: 5),
      //                       LinhaBotoes(botaoUm: "Aceito - Não Pago", botaoDois: "Aceito - Pago", botaoTres: "Cancelar", id: pedido[index].id, fun: this.loadListSetState),
      //                       SizedBox(height: 5),
      //                     ],
      //                   )
      //                 ],
      //               )
      //             )
      //         );
      //     });
      ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          pedido[index].isExpanded = !isExpanded;
        },
        children: pedido.map<ExpansionPanel>((Pedido item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.id.toString()),
              );
            },
            body: ListTile(
                title: Text(item.status),
                subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                    pedido.removeWhere((Pedido currentItem) => item == currentItem);
                }),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      );
  }

  String stringNull(String s){
    if(s != null){
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
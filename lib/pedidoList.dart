import 'package:fabricadechocolate/botoesAcoes.dart';
import 'package:fabricadechocolate/itemLinha.dart';
import 'package:fabricadechocolate/models/pedido.dart';
import 'package:flutter/material.dart';

class PedidosList extends StatelessWidget {

  final List<Pedido> pedido;
  final Function loadListSetState;
  PedidosList({Key key, this.pedido, this.loadListSetState}) : super(key: key);

  String status;

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: pedido == null ? 0 : pedido.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: InkWell(
                    onTap: () {
                    },
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            ItemLinha(item: "Nº Pedido : " + (pedido[index].id).toString()),
                            ItemLinha(item: "Nome : " + pedido[index].nome),
                            ItemLinha(item: "Status: " + statusPedido((pedido[index].status)).toUpperCase()),
                            ItemLinha(item: "Tipo : " + (pedido[index].tipoOvo).toUpperCase()),
                            LinhaBotoes(botaoUm: "Aceito - Não Pago", botaoDois: "Aceito - Pago", botaoTres: "Cancelar", id: pedido[index].id, fun: this.loadListSetState)
                          ],
                        )
                      ],
                    )
                  )
              );
          });
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
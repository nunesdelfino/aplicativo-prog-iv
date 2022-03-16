import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';

class EntregaListCopy extends StatelessWidget {
  final List<Pedido> entregas;
  static const IconData local_shipping =
      IconData(0xe3a6, fontFamily: 'MaterialIcons');
  static const IconData caderno =
      IconData(0xf0311, fontFamily: 'MaterialIcons');
  final Function funcao;
  
  EntregaListCopy({Key key, this.entregas, this.funcao}) : super(key: key);

  ApiService api = new ApiService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entregas == null ? 0 : entregas.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(caderno, size: 35),
              title: Text(entregas[index].nome),
              subtitle: Text(entregas[index].tipoOvo.toString()),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Icon(Icons.info),
                    IconButton(
                        onPressed: () {
                          _onClickDialog(context, entregas[index]);
                        },
                        icon: Icon(local_shipping, size: 25)),
                  ],
                ),
              ),
              onTap: () {
                _onClickDialogInfo(context, entregas[index]);
              },
            ),
          );
        }); //Forma o formato da listagem
  }

  _onClickDialog(BuildContext context, Pedido entregas) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            //title: Text("Entrega do Pedido: "),
            //content: Text("Deseja marcar pedido como entregue?"),
            title: Text("Entrega do pedido do cliente: " + entregas.nome),
            content: Text("Deseja marcar o pedido do cliente: " +
                entregas.nome +
                "\nTel:" +
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
                 // api.updateEntregas(entregas.id);
                  funcao();
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickDialogInfo(BuildContext context, Pedido entregas) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            //title: Text("Entrega do Pedido: "),
            //content: Text("Deseja marcar pedido como entregue?"),
            title: Text("Entrega do pedido do cliente: " + entregas.nome),
            content: Text("Cliente: " +
                entregas.nome +
                "\n\nTipo do Pedido: " +
                entregas.tipoOvo +
                "\n\nTel:" +
                entregas.contato),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

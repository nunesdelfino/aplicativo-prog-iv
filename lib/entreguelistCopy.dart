import 'package:fabricadechocolate/models/pedido.dart';
import 'package:flutter/material.dart';

class EntregueList extends StatelessWidget {
  final List<Pedido> entregas;
  EntregueList({Key key, this.entregas}) : super(key: key);
  static const IconData egg = IconData(0xf0311, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: entregas == null ? 0 : entregas.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(egg, size: 35),
              title: Text(entregas[index].nome),
              subtitle: Text(entregas[index].tipoOvo.toString()),
              trailing: SizedBox(
                width: 150,
                child: Row(children: [
                  Icon(Icons.info),
                ]),
              ),
              onTap: () {
                _onClickDialog(context, entregas[index]);
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

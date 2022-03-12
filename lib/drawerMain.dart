import 'package:fabricadechocolate/homePage.dart';
import 'package:fabricadechocolate/paginaEntrega.dart';
import 'package:fabricadechocolate/paginaPedido.dart';
import 'package:fabricadechocolate/pedidoList.dart';
import 'package:flutter/material.dart';

class DrawerMain extends Drawer {
<<<<<<< Updated upstream
  static const IconData local_shipping =
=======
   static const IconData local_shipping =
>>>>>>> Stashed changes
      IconData(0xe3a6, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
<<<<<<< Updated upstream
            accountName: Text("Fábrica de Chocolate"),
            accountEmail: Text("fabricadechocolate@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("F", style: TextStyle(fontSize: 40.0)),
=======
              accountName: Text("Fábrica de Chocolate"),
              accountEmail: Text("fabricadechocolate@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("F", style: TextStyle(fontSize: 40.0)),
                ),
            ),

            ListTile(
              title: Text("Tela Inicial"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Fabrica de Chocolate')));
              },
            ),
            ListTile(
              title: Text("Pedidos"),
              subtitle: Text("Pendentes e Não Pagos"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PeginaPedido(title: "Fábrica de Chocolate")));
              },
            ),
            ListTile(
            title: Text("Entregas"),
            subtitle: Text("Pendentes e Realizadas"),
            leading: Icon(local_shipping),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaginaEntrega(title: "Fábrica de Chocolate")));
            },
            ),
            ListTile(
              title: Text("Pesquisar Pedido"),
              leading: Icon(Icons.search),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaPesquisa(title: "Fábrica de Chocolate")));
              },
>>>>>>> Stashed changes
            ),
          ),
          ListTile(
            title: Text("Tela Inicial"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(title: 'Fabrica de Chocolate')));
            },
          ),
          ListTile(
            title: Text("Pedidos"),
            subtitle: Text("Pendentes e Não Pagos"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PeginaPedido(title: "Fábrica de Chocolate")));
            },
          ),
          ListTile(
            title: Text("Entregas"),
            subtitle: Text("Pendentes e Realizadas"),
            leading: Icon(local_shipping),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaginaEntrega(title: "Fábrica de Chocolate")));
            },
          ),
          ListTile(
            title: Text("Pesquisar Pedido"),
            leading: Icon(Icons.search),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

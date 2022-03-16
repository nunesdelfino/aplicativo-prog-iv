import 'package:fabricadechocolate/models/pedido.dart';
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'barra_busca.dart';
import 'paginaPedido.dart';
import 'package:flutter/widgets.dart';


class BarraBusca extends StatefulWidget {
  
  final Function pesquisar;
  BarraBusca({Key key, this.pesquisar}):super(key:key);

  @override
  _BarraBuscaState createState() => _BarraBuscaState();
 }

//pesquisaaa
  Pesquisa(TextEditingController myController){
    Future p;
    ApiService api = new ApiService();
    p = api.getById(myController.text);
  }
//passar função por parâmetro 

class _BarraBuscaState extends State<BarraBusca>{

  final myController = TextEditingController();

   
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
    
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
      labelText: "Search",
      hintText: "Digite o id do pedido",
      prefixIcon: IconButton(
        onPressed: (){
          widget.pesquisar(myController); //chamando a função que foi criada
        },
        icon: Icon(Icons.search),
      ),
      //prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );
  }

}
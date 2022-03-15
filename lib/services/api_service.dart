import 'dart:convert';

import 'package:fabricadechocolate/models/pedido.dart';
import 'package:http/http.dart';

class ApiService {

  final String apiURL = "http://192.168.1.12:8081/fabricadechocolate-api/api/v1/pedido/aceitos-pendentes";
  final String apiURLModi = "http://192.168.1.12:8081/fabricadechocolate-api/api/v1/pedido";

  Future<Pedido> getById(String id) async {
    Response res = await get('$apiURLModi/$id'); 
    if(res.statusCode == 200){
      return Pedido.fromJson(json.decode(res.body));
    }else{
      return null;
     // throw Exception('Pedido não encontrado');
    }
  }

  Future<List<Pedido>> getPedidos() async {
    Response res = await get(apiURL);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pedido> p = body.map((dynamic item) => Pedido.fromJson(item)).toList();
      return p;
    } if(res.statusCode == 404){
      return [];
    } else {
      throw "Falha ao carregar Lista";
    }
  }

  Future<Pedido> modificarPedido(int id, String acao) async {
    final response = await put('$apiURLModi/$id/$acao');

    if (response.statusCode == 200) {
      return Pedido.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

Future<List<Pedido>> entregar() async {
    Response res = await get('$apiURLModi/entregar');
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pedido> entregas =
          body.map((dynamic item) => Pedido.fromJson(item)).toList();
      return entregas;
    } else if (res.statusCode == 404) {
      return [];
    } else {
      throw "Falha ao carregar a lista de pedidos a serem entregues";
    }
  }

  Future<List<Pedido>> entregue() async {
    Response res = await get('$apiURLModi/entregue');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pedido> entregas =
          body.map((dynamic item) => Pedido.fromJson(item)).toList();
      return entregas;
    }
    if (res.statusCode == 404) {
      return [];
    } else {
      throw "Falha ao carregar Lista";
    }
  }

  Future<Pedido> updateEntregas(int id) async {
    Response response = await put('$apiURLModi/$id/entregar-pedido');
    if (response.statusCode == 200) {
      return Pedido.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao atualizar a entrega');
    }
  }

  Future<Pedido> desfazerEntrega(int id) async {
    Response response = await put('$apiURLModi/$id/desfazer-entrega');
    if (response.statusCode == 200) {
      return Pedido.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao atualizar a entrega');
    }
  }

}
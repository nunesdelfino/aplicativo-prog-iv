import 'dart:convert';

import 'package:fabricadechocolate/models/pedido.dart';
import 'package:http/http.dart';

class ApiService {

  final String apiURL = "http://192.168.3.100:8081/fabricadechocolate-api/api/v1/pedido";

  Future<List<Pedido>> getPedidos() async {
    Response res = await get(apiURL);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Pedido> p = body.map((dynamic item) => Pedido.fromJson(item)).toList();
      return p;
    } else {
      throw "Falha ao carregar Lista";
    }
  }

  Future<Pedido> aceitarPedidoPago(String id) async {
    final response = await put('$apiURL/$id/aceitar-pedido-pago');

    if (response.statusCode == 200) {
      return Pedido.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }
}
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'paginaPedido.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabrica de Chocolate',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Fabrica de Chocolate'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:p2/src/pages/home.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( 
    ChangeNotifierProvider(
      create: (context) => Cuenta(),
      child: MaterialApp(
        title: 'Tu app bancaria',
        home: HomePage()
      )
    )
  );
}


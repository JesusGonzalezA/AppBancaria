import 'package:flutter/material.dart';
import 'package:p2/src/pages/cuenta.dart';


class CuentaPage extends StatefulWidget {

  @override
  createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  
  final _estiloTexto = new TextStyle( 
    fontSize: 25,
  );
  int _saldo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'Cuenta:', style: _estiloTexto ),
            Text( "$_saldo €"  , style: _estiloTexto ),
          ],
        )
      )
    );
  }

}


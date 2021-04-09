import 'package:flutter/material.dart';


class InfoSaldoPage extends StatefulWidget {

  @override
  createState() => _InfoSaldoPageState();

}

class _InfoSaldoPageState extends State<InfoSaldoPage> {

  final _estiloTexto = new TextStyle( 
    fontSize: 25,
  );

  int _saldo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la cuenta'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( 'Saldo:', style: _estiloTexto ),
            Text( "$_saldo €"  , style: _estiloTexto ),
          ],
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }


  Widget _crearBotones() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero ), 
          onPressed: _changeCurrency
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton( 
          backgroundColor: Colors.red, 
          child: Icon(Icons.remove ), 
          onPressed: _subtract 
        ),
        SizedBox( width: 5.0 ),
        FloatingActionButton( 
          backgroundColor: Colors.green,
          child: Icon(Icons.add ), 
          onPressed: _add 
        ),
      ],
    );
  
  }

  void _add() {
    setState(() => _saldo++ );
  }

  void _subtract() {
    setState(() => _saldo-- );
  }

  void _changeCurrency() {
    setState(() => _saldo = 0 );
  }


}
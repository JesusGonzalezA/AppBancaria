import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/filters/filterConImpuestos.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';
import 'package:p2/src/filters/filterManager.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:provider/provider.dart';


class TransaccionesPage extends StatefulWidget {

  @override
  createState() => _TransaccionesPageState();
}

class _TransaccionesPageState extends State<TransaccionesPage> {
  
  final _estiloTexto = new TextStyle( 
    fontSize: 25,
  );

  final FilterManager filterManager = new FilterManager(
    new FilterChain(
      new List.from( 
        [
          new FilterConversorEuros(), 
          new FilterConImpuestos()
        ]
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    Cuenta cuenta = Provider.of<Cuenta>(context, listen: false);
    filterManager.aplicarFiltros(cuenta);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( 'Saldo de la cuenta: ', style: _estiloTexto ),
                Consumer<Cuenta>(
                  builder: (context, cuenta, child){
                    return Text( "${cuenta.saldo.toStringAsFixed(2)} ${cuenta.isEuros? "€" : "\$" }"  , style: _estiloTexto ); 
                  }
                )
              ]
            ),
            _createButtons(cuenta),
          ]
        )
      )
    );
  }

  Widget _createButtons (Cuenta cuenta) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: (){
              _decrement(cuenta);
            },
            tooltip: 'Decrement',
            backgroundColor: Colors.red,
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              _increment(cuenta);
            },
            backgroundColor: Colors.green,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<void> _increment(Cuenta cuenta) async {
    final controller =  TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registre un nuevo ingreso'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(labelText: "Ingreso"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: controller // Only numbers can be entered
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Registrar'),
              onPressed: () {
                cuenta.saldo += double.parse(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
}

  Future<void> _decrement(Cuenta cuenta) async {
    final controller =  TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registre una nueva factura'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(labelText: "Factura"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: controller // Only numbers can be entered
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Registrar'),
              onPressed: () {
                cuenta.saldo -= double.parse(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}



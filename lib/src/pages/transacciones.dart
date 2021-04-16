import 'package:flutter/material.dart';
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

    filterManager.aplicarFiltros(Provider.of<Cuenta>(context, listen: false));

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
          ]
        )
      )
    );
  }
}



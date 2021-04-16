import 'package:flutter/material.dart';
import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/filters/filterConImpuestos.dart';
import 'package:p2/src/filters/filterConversorDolares.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';
import 'package:p2/src/filters/filterManager.dart';
import 'package:p2/src/filters/filterSinImpuestos.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:provider/provider.dart';

class CuentaPage extends StatefulWidget {

  @override
  createState() => _CuentaPage();
}

class _CuentaPage extends State<CuentaPage> {

  final _estiloTexto = new TextStyle( 
    fontSize: 25,
  );
  final Filter filtroDolares = new FilterConversorDolares();
  final Filter filtroEuros   = new FilterConversorEuros();
  final Filter filtroSinImpuestos = new FilterSinImpuestos();
  final Filter filterConImpuestos = new FilterConImpuestos();
  final FilterManager filterManager = new FilterManager();

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _createButtons()
            ),
            _createEurosSinImpuestosButton()  
          ],
        )
      )
    );
  }

  Widget _createButtons () {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createEurosButton(),
          _createDolaresButton(),
          _createSinImpuestosButton(),
        ]
    );
  }

  Widget _createEurosButton () {
    return OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
              textStyle: new TextStyle(fontSize: 20)
            ),
            child: Text('Euros'),
            onPressed: () => {
              setState( () {
                var cuenta = context.read<Cuenta>();

                if (!cuenta.isEuros){
                  cuenta.isEuros = true;
                  filtroEuros.aplicar(cuenta);
                }
              })
            },
    );
  }

  Widget _createDolaresButton () {
    return OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
              textStyle: new TextStyle(fontSize: 20)
            ),
            child: Text('Dolares'),
            onPressed: () => {
              setState( () {
                var cuenta = context.read<Cuenta>();

                if (cuenta.isEuros){
                  cuenta.isEuros = false;
                  filtroDolares.aplicar(cuenta);
                }
                
              })
            },
    );
  }

  Widget _createSinImpuestosButton () {
    return OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
              textStyle: new TextStyle(fontSize: 20)
            ),
            child: Consumer<Cuenta>(
                  builder: (context, cuenta, child) {
                    return Text( "${cuenta.sinImpuestos? 'Con impuestos' : 'Sin impuestos' }"); 
                  }
            ),
            onPressed: () => {
              setState( () {
                var cuenta = context.read<Cuenta>();

                if (!cuenta.sinImpuestos){
                  cuenta.sinImpuestos = true;
                  filtroSinImpuestos.aplicar(cuenta);
                } else {
                  cuenta.sinImpuestos = false;
                  filterConImpuestos.aplicar(cuenta);
                }
              })
            },);
  }

  Widget _createEurosSinImpuestosButton () {
    return OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
              textStyle: new TextStyle(fontSize: 20)
            ),
            child: Text('Euros sin impuestos'),
            onPressed: () => {
              setState( () {
                var cuenta = context.read<Cuenta>();

                if (!cuenta.isEuros && !cuenta.sinImpuestos){
                  cuenta.isEuros = true;
                  cuenta.sinImpuestos = true;
                  filterManager.aplicarFiltros(cuenta);
                }
                
              })
            },);
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/src/app.dart';
import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/filters/filterConversorDolares.dart';
import 'package:p2/src/pages/cuenta.dart';

import 'package:p2/src/pages/home.dart';
import 'package:p2/src/pages/transacciones.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:provider/provider.dart';

Widget initializeApp() => ChangeNotifierProvider(
      create: (context) => Cuenta(),
      child: MaterialApp(
        title: 'Tu app bancaria',
        home: HomePage()
      )
);

Widget enterApp() => ChangeNotifierProvider(
      create: (context) => Cuenta(),
      child: MaterialApp(
        title: 'Tu app bancaria',
        home: MyApp()
      )
);


void main () {

  testWidgets('Probando que el provider se crea correctamente y arranca la aplicación', (tester) async {
    await tester.pumpWidget( initializeApp() );
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('La página de inicio cuando el usuario entra es la de transacciones', (tester) async {
    await tester.pumpWidget( enterApp() );
    expect(find.byType(TransaccionesPage), findsOneWidget);
  });

  testWidgets('Se muestra el saldo en euros y correctamente', (tester) async {
    await tester.pumpWidget( enterApp() );
    final String texto = "${new Cuenta().saldo.toStringAsFixed(2)} €";

    expect(find.byType(TransaccionesPage), findsOneWidget);
    expect(find.text( texto ), findsOneWidget);
  });

  testWidgets('Se realiza un ingreso y el saldo es actualizado', (tester) async {
    await tester.pumpWidget( enterApp() );
    
    final double saldoInicial = new Cuenta().saldo;

    // Abrir el diálogo
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Ingresar dinero
    await tester.enterText(find.byType(TextField), '10');
    await tester.tap(find.text('Registrar'));
    await tester.pump();

    final String texto = "${(10 + saldoInicial).toStringAsFixed(2)} €";
    expect(find.text( texto ), findsOneWidget);
  });

  testWidgets('Se realiza un ingreso y una conversión y el salario es actualizado', (tester) async {
    await tester.pumpWidget( enterApp() );
    
    final double saldoInicial = new Cuenta().saldo;

    // Ingresar dinero
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.enterText(find.byType(TextField), '10');
    await tester.tap(find.text('Registrar'));
    await tester.pump();

    // Cambiar de pestaña
    await tester.tap(find.byIcon(Icons.monetization_on));
    await tester.pump();

    // El saldo es actualizado-------------------------------------------------
    expect(find.byType(CuentaPage), findsOneWidget);
    final String texto = "${(10 + saldoInicial).toStringAsFixed(2)} €";
    expect(find.text( texto ), findsOneWidget);

    // Paso a dólares
    await tester.tap(find.text('Dolares'));
    await tester.pump();

    // El saldo es actualizado-------------------------------------------------
    final Filter filterDolares = new FilterConversorDolares();
    FilterChain filterChain = new FilterChain(
          new List.from( 
            [
              filterDolares
            ]
          )
    );
    Cuenta cuenta = new Cuenta();
    cuenta.saldo += 10;
    filterChain.aplicarFiltros(cuenta);
    
    final String textoActualizado = "${cuenta.saldo.toStringAsFixed(2)} \$";
    expect(find.textContaining( textoActualizado ), findsOneWidget);
  });

}
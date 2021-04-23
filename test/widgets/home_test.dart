
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:p2/src/pages/home.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:provider/provider.dart';

Widget createHome() => ChangeNotifierProvider(
      create: (context) => Cuenta(),
      child: MaterialApp(
        title: 'Tu app bancaria',
        home: HomePage()
      )
);

void main () {
  
  testWidgets('Probando que el provider se crea correctamente y arranca la aplicación', (tester) async {  
    await tester.pumpWidget(createHome());
    expect(find.byType(HomePage), findsOneWidget);
  }); 

  
}
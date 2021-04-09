import 'package:flutter/material.dart';
import 'pages/info_saldo_page.dart';
// import 'package:contador/src/pages/home_page.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build( context ) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: InfoSaldoPage(),
      ),
    );

  }


}
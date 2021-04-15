import 'package:flutter/material.dart';
import 'package:p2/src/pages/home.dart';
import 'package:p2/src/pages/cuenta.dart';
import 'package:p2/src/pages/transacciones.dart';


class MyApp extends StatefulWidget {

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _estiloTexto = new TextStyle( 
    fontSize: 25,
  );

  final List<Widget> _children = [
    TransaccionesPage(),
    CuentaPage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu App bancaria'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: _crearNavBar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _crearNavBar () {
    return (
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Transacciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Tu cuenta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      )
    );
  }
}

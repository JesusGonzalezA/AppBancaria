import 'package:flutter/material.dart';

class Cuenta with ChangeNotifier {

  double _saldo = 20.0;
  bool _isEuros = true;
  bool _sinImpuestos = false;

  get saldo {
    return _saldo;
  }

  get isEuros {
    return _isEuros;
  }

  get sinImpuestos {
    return _sinImpuestos;
  }

  set isEuros ( bool isEuros ) {
    this._isEuros = isEuros;
    notifyListeners();
  }

  set saldo ( double importe ) {
    this._saldo = importe;
    notifyListeners();
  }

  set sinImpuestos ( bool sinImpuestos ){
    this._sinImpuestos = sinImpuestos;
    notifyListeners();
  }
}
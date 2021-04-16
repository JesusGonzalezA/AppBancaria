import 'package:flutter/material.dart';

class Cuenta with ChangeNotifier {

  double _saldo = 0.0;
  bool _isEuros = true;

  get saldo {
    return _saldo;
  }

  get isEuros {
    return _isEuros;
  }

  set isEuros ( bool isEuros ) {
    this._isEuros = isEuros;
    notifyListeners();
  }

  set saldo ( double importe ) {
    this._saldo = importe;
    notifyListeners();
  }
}
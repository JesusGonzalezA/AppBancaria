import 'package:p2/src/providers/cuenta.dart';

import 'filter.dart';

class FilterConversorDolares extends Filter {

  final double CONVERSION = 1.18;

  FilterConversorDolares() : super() {}

  @override
  void aplicar (Cuenta cuenta) {
    if (cuenta.isEuros){
      cuenta.saldo *= CONVERSION;
      cuenta.isEuros = false;
    }
  }
}
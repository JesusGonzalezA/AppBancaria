import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterConImpuestos extends Filter {

  final double CONVERSION = 1/0.9;

  FilterConImpuestos() : super() {}

  @override
  void aplicar (Cuenta cuenta) {
    cuenta.saldo *= CONVERSION;
  }
}
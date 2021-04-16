import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterSinImpuestos extends Filter {

  final double CONVERSION = 0.9;

  FilterSinImpuestos() : super() {}

  @override
  void aplicar (Cuenta cuenta) {
    cuenta.saldo *= CONVERSION;
  }
}
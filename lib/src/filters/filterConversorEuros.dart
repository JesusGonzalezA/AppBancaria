import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterConversorEuros extends Filter {

  final double CONVERSION = 1.0/1.18;

  FilterConversorEuros() : super() {}

  @override
  void aplicar (Cuenta cuenta) {
    if (!cuenta.isEuros){
      cuenta.isEuros = true;
      cuenta.saldo *= CONVERSION;
    }
  }
}
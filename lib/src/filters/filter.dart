import 'package:p2/src/providers/cuenta.dart';

abstract class Filter {
  void aplicar(Cuenta cuenta);
}
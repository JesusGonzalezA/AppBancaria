
import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterManager {

  FilterChain _filterChain;

  FilterManager(FilterChain filterChain) {
    _filterChain = filterChain;
  }

  void aplicarFiltros (Cuenta cuenta) {
    _filterChain.aplicarFiltros(cuenta);
  }
}
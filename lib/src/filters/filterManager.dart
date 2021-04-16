
import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';
import 'package:p2/src/filters/filterSinImpuestos.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterManager {

  FilterChain _filterChain;

  FilterManager() {
    _filterChain = new FilterChain();
    _filterChain.addFilter(new FilterConversorEuros());
    _filterChain.addFilter(new FilterSinImpuestos());
  }

  void aplicarFiltros (Cuenta cuenta) {
    _filterChain.aplicarFiltros(cuenta);
  }
}
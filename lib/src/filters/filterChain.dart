
import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/providers/cuenta.dart';

class FilterChain {

  List<Filter> _filters = [];

  FilterChain() {
  }

  void aplicarFiltros (Cuenta cuenta) {
    _filters.forEach((filter) {
      filter.aplicar(cuenta);
    });
  }

  void addFilter ( Filter filter ) {
    _filters.add(filter);
  }

}
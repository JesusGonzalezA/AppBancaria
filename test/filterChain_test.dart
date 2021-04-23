import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';
import 'package:test/test.dart';

void main () {
  group('Probando filterChain', () {

    final Filter filterEuros = new FilterConversorEuros();
    FilterChain filterChain = new FilterChain(
          new List.from( 
            [
              filterEuros
            ]
          )
    );

    test('Se agrega correctamente un filtro', (){
      final int numFiltros = filterChain.filters.length;

      filterChain.addFilter(filterEuros);

      expect(filterChain.filters.length, numFiltros + 1);
    });

  });
}
import 'package:test/test.dart';

import 'package:p2/src/filters/filterChain.dart';
import 'package:p2/src/filters/filterConImpuestos.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';
import 'package:p2/src/providers/cuenta.dart';

import 'package:p2/src/filters/filterManager.dart';
import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/filters/filterSinImpuestos.dart';
import 'package:p2/src/filters/filterConversorDolares.dart';

void main () {

  group('Manager con varios filtros', () {

    final Filter filtroEuros   = new FilterConversorEuros();
    final Filter filtroDolares = new FilterConversorDolares();
    final Filter filtroSinImpuestos = new FilterSinImpuestos();
    final Filter filtroConImpuestos = new FilterConImpuestos();
    final Cuenta cuenta = new Cuenta();
    final double saldoInicial = cuenta.saldo;
    
    test('El saldo de la cuenta en euros y sin impuestos pasa a estar en dólares sin impuestos', () {
      final FilterManager filterManager = new FilterManager(
        new FilterChain(
          new List.from( 
            [
              filtroDolares, 
              filtroSinImpuestos
            ]
          )
        )
      );

      filterManager.aplicarFiltros(cuenta);

      expect(cuenta.isEuros, false);
      expect(cuenta.sinImpuestos, true);
    });

    test('La cuenta vuelve a estar en euros y con el saldo inicial', () {
      final FilterManager filterManager = new FilterManager(
        new FilterChain(
          new List.from( 
            [
              filtroEuros, 
              filtroConImpuestos
            ]
          )
        )
      );

      filterManager.aplicarFiltros(cuenta);
      expect(cuenta.saldo, saldoInicial);
      expect(cuenta.isEuros, true);
    });

    test('No actúa el filtro si ya se ha pasado', () {
      final Cuenta cuenta = new Cuenta();
      final FilterManager filterManager = new FilterManager(
        new FilterChain(
          new List.from( 
            [
              filtroDolares, 
              filtroSinImpuestos
            ]
          )
        )
      );

      filterManager.aplicarFiltros(cuenta);
      final Cuenta cuentaPostFiltro = cuenta;

      filterManager.aplicarFiltros(cuenta);
      
      expect(cuenta, cuentaPostFiltro);
    });
  });
}
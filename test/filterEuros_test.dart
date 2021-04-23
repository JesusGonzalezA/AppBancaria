import 'package:test/test.dart';

import 'package:p2/src/filters/filter.dart';
import 'package:p2/src/providers/cuenta.dart';
import 'package:p2/src/filters/filterConversorEuros.dart';

void main () {

  group('Filtro conversor de euros', () {
    final Filter filtroEuros   = new FilterConversorEuros();
    final Cuenta cuenta = new Cuenta();

    test('Se cambia la moneda cuando se aplica el filtro', () {
      cuenta.isEuros = false;

      filtroEuros.aplicar(cuenta);
      expect(cuenta.isEuros, true);
    });

    test('Se cambia el saldo cuando se aplica el filtro', () {
      cuenta.isEuros = false;
      final saldoInicial = cuenta.saldo;

      filtroEuros.aplicar(cuenta);

      expect(cuenta.saldo < saldoInicial, true);
    });

    test('Si el saldo es 0 no cambia el saldo pero sí la moneda', () {
      cuenta.isEuros = false;
      cuenta.saldo = 0;
      final saldoInicial = cuenta.saldo;

      filtroEuros.aplicar(cuenta);

      expect(cuenta.saldo == saldoInicial, true);
      expect(cuenta.isEuros, true);
    });

    test('Si ya se ha aplicado no se vuelve a aplicar', () {
      cuenta.saldo = 100;
      cuenta.isEuros = true;
      final saldoInicial = cuenta.saldo;

      filtroEuros.aplicar(cuenta);

      expect(cuenta.saldo < saldoInicial, false);
    });
    
  });
}
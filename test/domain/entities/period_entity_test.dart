import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

void main() {
  group('PeriodEntity', () {
    test('Should create a valid instance', () {
      const entity = PeriodEntity(
        tempoFormatado: '3 hours',
        tempo: '3',
        valor: 100.0,
        valorTotal: 90.0,
        temCortesia: false,
        desconto: DiscountEntity(desconto: 10.0),
      );

      expect(entity.tempoFormatado, '3 hours');
      expect(entity.tempo, '3');
      expect(entity.valor, 100.0);
      expect(entity.valorTotal, 90.0);
      expect(entity.temCortesia, false);
      expect(entity.desconto, const DiscountEntity(desconto: 10.0));
    });

    test('Should compare two instances correctly (Equatable)', () {
      const entity1 = PeriodEntity(
        tempoFormatado: '6 hours',
        tempo: '6',
        valor: 150.0,
        valorTotal: 135.0,
        temCortesia: true,
        desconto: DiscountEntity(desconto: 15.0),
      );

      const entity2 = PeriodEntity(
        tempoFormatado: '6 hours',
        tempo: '6',
        valor: 150.0,
        valorTotal: 135.0,
        temCortesia: true,
        desconto: DiscountEntity(desconto: 15.0),
      );

      const entity3 = PeriodEntity(
        tempoFormatado: '12 hours',
        tempo: '12',
        valor: 200.0,
        valorTotal: 180.0,
        temCortesia: false,
        desconto: DiscountEntity(desconto: 20.0),
      );

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });

    test('Should return the correct props', () {
      const entity = PeriodEntity(
        tempoFormatado: '1 hour',
        tempo: '1',
        valor: 50.0,
        valorTotal: 45.0,
        temCortesia: true,
        desconto: DiscountEntity(desconto: 5.0),
      );

      expect(entity.props, [
        '1 hour',
        '1',
        50.0,
        45.0,
        true,
        const DiscountEntity(desconto: 5.0),
      ]);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/data/models/period_model.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

void main() {
  group('PeriodModel', () {
    test('Should convert a valid JSON to a PeriodEntity', () {
      final json = {
        'tempoFormatado': '3 horas',
        'tempo': '3',
        'valor': 120.0,
        'valorTotal': 100.0,
        'temCortesia': false,
        'desconto': {'desconto': 20.0},
      };

      final period = PeriodModel.fromJson(json);

      expect(period, isA<PeriodEntity>());
      expect(period.tempoFormatado, '3 horas');
      expect(period.tempo, '3');
      expect(period.valor, 120.0);
      expect(period.valorTotal, 100.0);
      expect(period.temCortesia, false);
      expect(period.desconto, isA<DiscountEntity>());
      expect(period.desconto?.desconto, 20.0);
    });

    test('Should handle null discount field', () {
      final json = {
        'tempoFormatado': '6 horas',
        'tempo': '6',
        'valor': 150.0,
        'valorTotal': 150.0,
        'temCortesia': true,
        'desconto': null,
      };

      final period = PeriodModel.fromJson(json);

      expect(period.desconto, isNull);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'tempoFormatado': '12 horas',
        'valor': 200.0,
      };

      expect(() => PeriodModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const period = PeriodEntity(
        tempoFormatado: '3 horas',
        tempo: '3',
        valor: 120.0,
        valorTotal: 100.0,
        temCortesia: false,
        desconto: DiscountEntity(desconto: 20.0),
      );

      expect(period.props, [
        '3 horas',
        '3',
        120.0,
        100.0,
        false,
        const DiscountEntity(desconto: 20.0),
      ]);
    });
  });
}

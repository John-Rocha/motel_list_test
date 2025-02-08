import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';
import 'package:motel_list_test/data/models/discount_model.dart';

void main() {
  group('DiscountModel', () {
    test('Should convert a valid JSON to a DiscountEntity', () {
      final json = <String, dynamic>{
        'desconto': 20.0,
      };

      final discount = DiscountModel.fromJson(json);

      expect(discount, isA<DiscountEntity>());
      expect(discount.desconto, 20.0);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = <String, dynamic>{};

      expect(() => DiscountModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const discount = DiscountEntity(
        desconto: 15.0,
      );

      expect(discount.props, [15.0]);
    });
  });
}

import 'package:motel_list_test/domain/entities/discount_entity.dart';

sealed class DiscountModel {
  static DiscountEntity fromJson(Map<String, dynamic> json) {
    return DiscountEntity(
      desconto: json['desconto'],
    );
  }
}

import 'package:motel_list_test/domain/entities/item_suite_entity.dart';

sealed class ItemSuiteModel {
  static ItemSuiteEntity fromJson(Map<String, dynamic> json) {
    return ItemSuiteEntity(
      nome: json['nome'],
    );
  }
}

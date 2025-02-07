import 'package:motel_list_test/domain/entities/category_item_entity.dart';

sealed class CategoryItemModel {
  static CategoryItemEntity fromJson(Map<String, dynamic> json) {
    return CategoryItemEntity(
      nome: json['nome'],
      icone: json['icone'],
    );
  }
}

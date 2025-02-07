import 'package:motel_list_test/data/models/category_item_model.dart';
import 'package:motel_list_test/data/models/item_suite_model.dart';
import 'package:motel_list_test/data/models/period_model.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';

sealed class SuiteModel {
  static SuiteEntity fromJson(Map<String, dynamic> json) {
    return SuiteEntity(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: (json['fotos'] as List).map((e) => e.toString()).toList(),
      itens: (json['itens'] as List)
          .map((e) => ItemSuiteModel.fromJson(e))
          .toList(),
      categoriaItens: (json['categoriaItens'] as List)
          .map((e) => CategoryItemModel.fromJson(e))
          .toList(),
      periodos: (json['periodos'] as List)
          .map((e) => PeriodModel.fromJson(e))
          .toList(),
    );
  }
}

import 'package:equatable/equatable.dart';

import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';

class SuiteEntity extends Equatable {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemSuiteEntity> itens;
  final List<CategoryItemEntity> categoriaItens;
  final List<PeriodEntity> periodos;

  const SuiteEntity({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  @override
  List<Object> get props => [
        nome,
        qtd,
        exibirQtdDisponiveis,
        fotos,
        itens,
        categoriaItens,
        periodos,
      ];
}

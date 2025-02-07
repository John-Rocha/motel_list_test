import 'package:equatable/equatable.dart';
import 'entities.dart';

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

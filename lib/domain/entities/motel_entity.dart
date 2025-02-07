import 'package:equatable/equatable.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';

class MotelEntity extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteEntity> suites;
  final int? qtdAvaliacoes;
  final double? media;

  const MotelEntity({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  @override
  List<Object?> get props => [
        fantasia,
        logo,
        bairro,
        distancia,
        qtdFavoritos,
        suites,
        qtdAvaliacoes,
        media,
      ];
}

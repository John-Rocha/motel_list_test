import 'package:equatable/equatable.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';

class MotelDataEntity extends Equatable {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final int raio;
  final double maxPaginas;
  final List<MotelEntity> moteis;

  const MotelDataEntity({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  @override
  List<Object> get props => [
        pagina,
        qtdPorPagina,
        totalSuites,
        totalMoteis,
        raio,
        maxPaginas,
        moteis,
      ];
}

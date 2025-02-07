import 'package:equatable/equatable.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

class PeriodEntity extends Equatable {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DiscountEntity? desconto;

  const PeriodEntity({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  @override
  List<Object?> get props => [
        tempoFormatado,
        tempo,
        valor,
        valorTotal,
        temCortesia,
        desconto,
      ];
}

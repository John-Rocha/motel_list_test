import 'package:equatable/equatable.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';

class MotelResponseEntity extends Equatable {
  final bool sucesso;
  final MotelDataEntity data;
  final List<dynamic> mensagem;

  const MotelResponseEntity({
    required this.sucesso,
    required this.data,
    required this.mensagem,
  });

  @override
  List<Object> get props => [sucesso, data, mensagem];
}

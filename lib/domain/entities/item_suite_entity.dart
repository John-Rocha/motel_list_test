import 'package:equatable/equatable.dart';

class ItemSuiteEntity extends Equatable {
  final String nome;

  const ItemSuiteEntity({required this.nome});

  @override
  List<Object> get props => [nome];
}

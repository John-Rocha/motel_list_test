import 'package:equatable/equatable.dart';

class CategoryItemEntity extends Equatable {
  final String nome;
  final String icone;

  const CategoryItemEntity({
    required this.nome,
    required this.icone,
  });

  @override
  List<Object> get props => [nome, icone];
}

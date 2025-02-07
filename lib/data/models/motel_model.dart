import 'package:motel_list_test/data/models/suite_model.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';

sealed class MotelModel {
  static MotelEntity fromJson(Map<String, dynamic> json) {
    return MotelEntity(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: json['distancia'],
      qtdFavoritos: json['qtdFavoritos'],
      suites:
          (json['suites'] as List).map((e) => SuiteModel.fromJson(e)).toList(),
      qtdAvaliacoes: json['qtdAvaliacoes'],
      media: json['media'],
    );
  }
}

import 'package:motel_list_test/data/models/motel_model.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';

sealed class MotelDataModel {
  static MotelDataEntity fromJson(Map<String, dynamic> json) {
    return MotelDataEntity(
      pagina: json['pagina'],
      qtdPorPagina: json['qtdPorPagina'],
      totalSuites: json['totalSuites'],
      totalMoteis: json['totalMoteis'],
      raio: json['raio'],
      maxPaginas: json['maxPaginas'],
      moteis:
          (json['moteis'] as List).map((e) => MotelModel.fromJson(e)).toList(),
    );
  }
}

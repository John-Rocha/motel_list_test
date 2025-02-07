import 'package:motel_list_test/data/models/motel_data_model.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';

sealed class MotelResponseModel {
  static MotelResponseEntity fromJson(Map<String, dynamic> json) {
    return MotelResponseEntity(
      sucesso: json['sucesso'],
      data: MotelDataModel.fromJson(json['data']),
      mensagem: json['mensagem'],
    );
  }
}

import 'dart:convert';

import 'package:motel_list_test/data/models/motel_response_model.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';
import 'package:http/http.dart' as http;

abstract interface class MotelDatasource {
  Future<MotelResponseEntity> fetchMotelData();
}

final class MotelDatasourceImpl implements MotelDatasource {
  @override
  Future<MotelResponseEntity> fetchMotelData() async {
    final url = Uri.parse('https://www.jsonkeeper.com/b/1IXK');
    final response = await http.get(url);

    return MotelResponseModel.fromJson(jsonDecode(response.body));
  }
}

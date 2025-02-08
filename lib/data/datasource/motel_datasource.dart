import 'dart:convert';
import 'dart:io';

import 'package:motel_list_test/data/models/motel_response_model.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';

abstract interface class MotelDatasource {
  Future<MotelResponseEntity> fetchMotelData();
}

final class MotelDatasourceImpl implements MotelDatasource {
  final HttpClient _httpClient;

  const MotelDatasourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<MotelResponseEntity> fetchMotelData() async {
    final url = Uri.parse('https://www.jsonkeeper.com/b/1IXK');
    final request = await _httpClient.getUrl(url);
    final response = await request.close();

    final jsonString = await response.transform(utf8.decoder).join();

    return MotelResponseModel.fromJson(jsonDecode(jsonString));
  }
}

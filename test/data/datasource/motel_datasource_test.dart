import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motel_list_test/data/datasource/motel_datasource.dart';

import 'package:motel_list_test/domain/entities/motel_response_entity.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

class UriFake extends Fake implements Uri {}

void main() {
  late HttpClient mockHttpClient;
  late MotelDatasource datasource;

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = MotelDatasourceImpl(httpClient: mockHttpClient);
  });

  test('Should return a MotelResponseEntity when the request is successful',
      () async {
    final mockRequest = MockHttpClientRequest();
    final mockResponse = MockHttpClientResponse();
    const jsonResponse = '''
    {
      "sucesso": true,
      "data": {
        "pagina": 1,
        "qtdPorPagina": 10,
        "totalSuites": 20,
        "totalMoteis": 5,
        "raio": 10,
        "maxPaginas": 2.0,
        "moteis": []
      },
      "mensagem": []
    }
    ''';

    when(() => mockHttpClient.getUrl(any()))
        .thenAnswer((_) async => mockRequest);
    when(() => mockRequest.close()).thenAnswer((_) async => mockResponse);
    when(() => mockResponse.transform(utf8.decoder))
        .thenAnswer((_) => Stream.value(jsonResponse));

    final result = await datasource.fetchMotelData();

    expect(result, isA<MotelResponseEntity>());
    expect(result.sucesso, true);
    expect(result.data.pagina, 1);
    expect(result.data.qtdPorPagina, 10);
  });

  test('Should throw an exception when the request fails', () async {
    final mockRequest = MockHttpClientRequest();

    when(() => mockHttpClient.getUrl(any()))
        .thenAnswer((_) async => mockRequest);
    when(() => mockRequest.close()).thenThrow(Exception('Request failed'));

    expect(() => datasource.fetchMotelData(), throwsA(isA<Exception>()));
  });
}

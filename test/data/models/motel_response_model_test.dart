import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/data/models/motel_response_model.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';

void main() {
  group('MotelResponseModel', () {
    test('Should convert a valid JSON to a MotelResponseEntity', () {
      final json = {
        'sucesso': true,
        'data': {
          'pagina': 1,
          'qtdPorPagina': 10,
          'totalSuites': 20,
          'totalMoteis': 5,
          'raio': 10,
          'maxPaginas': 2.0,
          'moteis': [
            {
              'fantasia': 'Motel Example',
              'logo': 'https://example.com/logo.png',
              'bairro': 'Downtown',
              'distancia': 3.5,
              'qtdFavoritos': 10,
              'suites': [],
              'qtdAvaliacoes': 100,
              'media': 4.5,
            }
          ],
        },
        'mensagem': [],
      };

      final motelResponse = MotelResponseModel.fromJson(json);

      expect(motelResponse, isA<MotelResponseEntity>());
      expect(motelResponse.sucesso, true);
      expect(motelResponse.data.pagina, 1);
      expect(motelResponse.data.qtdPorPagina, 10);
      expect(motelResponse.data.totalSuites, 20);
      expect(motelResponse.data.totalMoteis, 5);
      expect(motelResponse.data.raio, 10);
      expect(motelResponse.data.maxPaginas, 2.0);
      expect(motelResponse.data.moteis.length, 1);
      expect(motelResponse.data.moteis.first.fantasia, 'Motel Example');
      expect(motelResponse.mensagem, isA<List>());
    });

    test('Should handle empty message list', () {
      final json = {
        'sucesso': true,
        'data': {
          'pagina': 1,
          'qtdPorPagina': 10,
          'totalSuites': 20,
          'totalMoteis': 5,
          'raio': 10,
          'maxPaginas': 2.0,
          'moteis': [],
        },
        'mensagem': [],
      };

      final motelResponse = MotelResponseModel.fromJson(json);

      expect(motelResponse.mensagem, isEmpty);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'sucesso': true,
      };

      expect(
        () => MotelResponseModel.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('Should return correct props', () {
      const motelResponse = MotelResponseEntity(
        sucesso: true,
        data: MotelDataEntity(
          pagina: 1,
          qtdPorPagina: 10,
          totalSuites: 20,
          totalMoteis: 5,
          raio: 10,
          maxPaginas: 2.0,
          moteis: [],
        ),
        mensagem: [],
      );

      expect(motelResponse.props, [true, isA<MotelDataEntity>(), []]);
    });
  });
}

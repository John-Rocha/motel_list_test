import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/data/models/motel_data_model.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';

void main() {
  group('MotelDataModel', () {
    test('Should convert a valid JSON to a MotelDataEntity', () {
      final json = {
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
      };

      final motelData = MotelDataModel.fromJson(json);

      expect(motelData, isA<MotelDataEntity>());
      expect(motelData.pagina, 1);
      expect(motelData.qtdPorPagina, 10);
      expect(motelData.totalSuites, 20);
      expect(motelData.totalMoteis, 5);
      expect(motelData.raio, 10);
      expect(motelData.maxPaginas, 2.0);
      expect(motelData.moteis, isA<List<MotelEntity>>());
      expect(motelData.moteis.length, 1);
      expect(motelData.moteis.first.fantasia, 'Motel Example');
    });

    test('Should return an empty list when moteis is null', () {
      final json = {
        'pagina': 1,
        'qtdPorPagina': 10,
        'totalSuites': 20,
        'totalMoteis': 5,
        'raio': 10,
        'maxPaginas': 2.0,
        'moteis': [],
      };

      final motelData = MotelDataModel.fromJson(json);

      expect(motelData.moteis, isEmpty);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'pagina': 1,
        'qtdPorPagina': 10,
      };

      expect(() => MotelDataModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const motelData = MotelDataEntity(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 20,
        totalMoteis: 5,
        raio: 10,
        maxPaginas: 2.0,
        moteis: [],
      );

      expect(motelData.props, [
        1,
        10,
        20,
        5,
        10,
        2.0,
        [],
      ]);
    });
  });
}

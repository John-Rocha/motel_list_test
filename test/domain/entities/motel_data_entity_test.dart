import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';

void main() {
  group('MotelDataEntity', () {
    test('Should create a valid instance', () {
      const motelData = MotelDataEntity(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 20,
        totalMoteis: 5,
        raio: 10,
        maxPaginas: 2.0,
        moteis: [
          MotelEntity(
            fantasia: 'Motel Paradise',
            logo: 'https://example.com/logo.png',
            bairro: 'Downtown',
            distancia: 3.5,
            qtdFavoritos: 10,
            suites: [],
            qtdAvaliacoes: 100,
            media: 4.5,
          ),
        ],
      );

      expect(motelData.pagina, 1);
      expect(motelData.qtdPorPagina, 10);
      expect(motelData.totalSuites, 20);
      expect(motelData.totalMoteis, 5);
      expect(motelData.raio, 10);
      expect(motelData.maxPaginas, 2.0);
      expect(motelData.moteis.length, 1);
    });

    test('Should compare two instances correctly (Equatable)', () {
      const motelData1 = MotelDataEntity(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 20,
        totalMoteis: 5,
        raio: 10,
        maxPaginas: 2.0,
        moteis: [],
      );

      const motelData2 = MotelDataEntity(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 20,
        totalMoteis: 5,
        raio: 10,
        maxPaginas: 2.0,
        moteis: [],
      );

      const motelData3 = MotelDataEntity(
        pagina: 2,
        qtdPorPagina: 5,
        totalSuites: 15,
        totalMoteis: 3,
        raio: 5,
        maxPaginas: 3.0,
        moteis: [],
      );

      expect(motelData1, equals(motelData2));
      expect(motelData1, isNot(equals(motelData3)));
    });

    test('Should return the correct props', () {
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

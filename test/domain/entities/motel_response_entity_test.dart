import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';

void main() {
  group('MotelResponseEntity', () {
    test('Should create a valid instance', () {
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

      expect(motelResponse.sucesso, true);
      expect(motelResponse.data.pagina, 1);
      expect(motelResponse.data.qtdPorPagina, 10);
      expect(motelResponse.data.totalSuites, 20);
      expect(motelResponse.data.totalMoteis, 5);
      expect(motelResponse.data.raio, 10);
      expect(motelResponse.data.maxPaginas, 2.0);
      expect(motelResponse.data.moteis, isEmpty);
      expect(motelResponse.mensagem, isEmpty);
    });

    test('Should compare two instances correctly (Equatable)', () {
      const motelResponse1 = MotelResponseEntity(
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

      const motelResponse2 = MotelResponseEntity(
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

      const motelResponse3 = MotelResponseEntity(
        sucesso: false,
        data: MotelDataEntity(
          pagina: 2,
          qtdPorPagina: 5,
          totalSuites: 15,
          totalMoteis: 3,
          raio: 5,
          maxPaginas: 3.0,
          moteis: [],
        ),
        mensagem: ['Error occurred'],
      );

      expect(motelResponse1, equals(motelResponse2));
      expect(motelResponse1, isNot(equals(motelResponse3)));
    });

    test('Should return the correct props', () {
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
        mensagem: ['Success'],
      );

      expect(motelResponse.props, [
        true,
        const MotelDataEntity(
          pagina: 1,
          qtdPorPagina: 10,
          totalSuites: 20,
          totalMoteis: 5,
          raio: 10,
          maxPaginas: 2.0,
          moteis: [],
        ),
        ['Success'],
      ]);
    });
  });
}

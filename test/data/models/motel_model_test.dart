import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/data/models/motel_model.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';

void main() {
  group('MotelModel', () {
    test('Should convert a valid JSON to a MotelEntity', () {
      final json = {
        'fantasia': 'Motel Example',
        'logo': 'https://example.com/logo.png',
        'bairro': 'Downtown',
        'distancia': 3.5,
        'qtdFavoritos': 10,
        'suites': [
          {
            'nome': 'Luxury Suite',
            'qtd': 2,
            'exibirQtdDisponiveis': true,
            'fotos': ['https://example.com/suite.jpg'],
            'itens': [],
            'categoriaItens': [],
            'periodos': [],
          }
        ],
        'qtdAvaliacoes': 100,
        'media': 4.5,
      };

      final motel = MotelModel.fromJson(json);

      expect(motel, isA<MotelEntity>());
      expect(motel.fantasia, 'Motel Example');
      expect(motel.logo, 'https://example.com/logo.png');
      expect(motel.bairro, 'Downtown');
      expect(motel.distancia, 3.5);
      expect(motel.qtdFavoritos, 10);
      expect(motel.suites, isA<List<SuiteEntity>>());
      expect(motel.suites.length, 1);
      expect(motel.suites.first.nome, 'Luxury Suite');
      expect(motel.qtdAvaliacoes, 100);
      expect(motel.media, 4.5);
    });

    test('Should return an empty list when suites is null', () {
      final json = {
        'fantasia': 'Motel Example',
        'logo': 'https://example.com/logo.png',
        'bairro': 'Downtown',
        'distancia': 3.5,
        'qtdFavoritos': 10,
        'suites': [],
        'qtdAvaliacoes': 100,
        'media': 4.5,
      };

      final motel = MotelModel.fromJson(json);

      expect(motel.suites, isEmpty);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'fantasia': 'Motel Example',
        'bairro': 'Downtown',
      };

      expect(() => MotelModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const motel = MotelEntity(
        fantasia: 'Motel Example',
        logo: 'https://example.com/logo.png',
        bairro: 'Downtown',
        distancia: 3.5,
        qtdFavoritos: 10,
        suites: [],
        qtdAvaliacoes: 100,
        media: 4.5,
      );

      expect(motel.props, [
        'Motel Example',
        'https://example.com/logo.png',
        'Downtown',
        3.5,
        10,
        [],
        100,
        4.5,
      ]);
    });
  });
}

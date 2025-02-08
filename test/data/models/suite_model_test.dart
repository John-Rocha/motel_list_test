import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/data/models/suite_model.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';

void main() {
  group('SuiteModel', () {
    test('Should convert a valid JSON to a SuiteEntity', () {
      final json = {
        'nome': 'Luxury Suite',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': ['https://example.com/suite.jpg'],
        'itens': [
          {'nome': 'TV'},
        ],
        'categoriaItens': [
          {'nome': 'Wi-Fi', 'icone': 'https://example.com/wifi.png'},
        ],
        'periodos': [
          {
            'tempoFormatado': '3 horas',
            'tempo': '3',
            'valor': 120.0,
            'valorTotal': 100.0,
            'temCortesia': false,
            'desconto': {'desconto': 20.0},
          }
        ],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite, isA<SuiteEntity>());
      expect(suite.nome, 'Luxury Suite');
      expect(suite.qtd, 2);
      expect(suite.exibirQtdDisponiveis, true);
      expect(suite.fotos, isA<List<String>>());
      expect(suite.fotos.first, 'https://example.com/suite.jpg');
      expect(suite.itens, isA<List<ItemSuiteEntity>>());
      expect(suite.itens.first.nome, 'TV');
      expect(suite.categoriaItens, isA<List<CategoryItemEntity>>());
      expect(suite.categoriaItens.first.nome, 'Wi-Fi');
      expect(suite.periodos, isA<List<PeriodEntity>>());
      expect(suite.periodos.first.tempoFormatado, '3 horas');
    });

    test('Should return an empty list when fotos is null', () {
      final json = {
        'nome': 'Luxury Suite',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': [],
        'itens': [],
        'categoriaItens': [],
        'periodos': [],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite.fotos, isEmpty);
      expect(suite.itens, isEmpty);
      expect(suite.categoriaItens, isEmpty);
      expect(suite.periodos, isEmpty);
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'nome': 'Luxury Suite',
        'qtd': 2,
      };

      expect(() => SuiteModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const suite = SuiteEntity(
        nome: 'Luxury Suite',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/suite.jpg'],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      expect(suite.props, [
        'Luxury Suite',
        2,
        true,
        ['https://example.com/suite.jpg'],
        [],
        [],
        [],
      ]);
    });
  });
}

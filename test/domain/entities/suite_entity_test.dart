import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

void main() {
  group('SuiteEntity', () {
    test('Should create a valid instance', () {
      const suite = SuiteEntity(
        nome: 'Luxury Suite',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: [
          'https://example.com/photo1.jpg',
          'https://example.com/photo2.jpg',
        ],
        itens: [ItemSuiteEntity(nome: 'Wi-Fi')],
        categoriaItens: [
          CategoryItemEntity(
            nome: 'Fridge',
            icone: 'https://example.com/icon.png',
          ),
        ],
        periodos: [
          PeriodEntity(
            tempoFormatado: '3 hours',
            tempo: '3',
            valor: 120.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: DiscountEntity(desconto: 20.0),
          ),
        ],
      );

      expect(suite.nome, 'Luxury Suite');
      expect(suite.qtd, 2);
      expect(suite.exibirQtdDisponiveis, true);
      expect(suite.fotos.length, 2);
      expect(suite.itens.first.nome, 'Wi-Fi');
      expect(suite.categoriaItens.first.nome, 'Fridge');
      expect(suite.periodos.first.tempoFormatado, '3 hours');
    });

    test('Should compare two instances correctly (Equatable)', () {
      const suite1 = SuiteEntity(
        nome: 'Luxury Suite',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/photo1.jpg'],
        itens: [ItemSuiteEntity(nome: 'Wi-Fi')],
        categoriaItens: [
          CategoryItemEntity(
            nome: 'Fridge',
            icone: 'https://example.com/icon.png',
          ),
        ],
        periodos: [
          PeriodEntity(
            tempoFormatado: '3 hours',
            tempo: '3',
            valor: 120.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: DiscountEntity(desconto: 20.0),
          ),
        ],
      );

      const suite2 = SuiteEntity(
        nome: 'Luxury Suite',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/photo1.jpg'],
        itens: [ItemSuiteEntity(nome: 'Wi-Fi')],
        categoriaItens: [
          CategoryItemEntity(
            nome: 'Fridge',
            icone: 'https://example.com/icon.png',
          ),
        ],
        periodos: [
          PeriodEntity(
            tempoFormatado: '3 hours',
            tempo: '3',
            valor: 120.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: DiscountEntity(desconto: 20.0),
          ),
        ],
      );

      const suite3 = SuiteEntity(
        nome: 'Standard Suite',
        qtd: 1,
        exibirQtdDisponiveis: false,
        fotos: ['https://example.com/photo2.jpg'],
        itens: [ItemSuiteEntity(nome: 'TV')],
        categoriaItens: [
          CategoryItemEntity(
            nome: 'Air Conditioning',
            icone: 'https://example.com/icon2.png',
          ),
        ],
        periodos: [
          PeriodEntity(
            tempoFormatado: '6 hours',
            tempo: '6',
            valor: 180.0,
            valorTotal: 150.0,
            temCortesia: true,
            desconto: DiscountEntity(desconto: 30.0),
          ),
        ],
      );

      expect(suite1, equals(suite2));
      expect(suite1, isNot(equals(suite3)));
    });

    test('Should return the correct props', () {
      const suite = SuiteEntity(
        nome: 'Luxury Suite',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/photo1.jpg'],
        itens: [ItemSuiteEntity(nome: 'Wi-Fi')],
        categoriaItens: [
          CategoryItemEntity(
            nome: 'Fridge',
            icone: 'https://example.com/icon.png',
          ),
        ],
        periodos: [
          PeriodEntity(
            tempoFormatado: '3 hours',
            tempo: '3',
            valor: 120.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: DiscountEntity(desconto: 20.0),
          ),
        ],
      );

      expect(suite.props, [
        'Luxury Suite',
        2,
        true,
        ['https://example.com/photo1.jpg'],
        [const ItemSuiteEntity(nome: 'Wi-Fi')],
        [
          const CategoryItemEntity(
            nome: 'Fridge',
            icone: 'https://example.com/icon.png',
          ),
        ],
        [
          const PeriodEntity(
            tempoFormatado: '3 hours',
            tempo: '3',
            valor: 120.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: DiscountEntity(desconto: 20.0),
          ),
        ],
      ]);
    });
  });
}

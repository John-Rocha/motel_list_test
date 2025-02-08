import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/domain/entities/period_entity.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

void main() {
  group('MotelEntity', () {
    test('Should create a valid instance', () {
      const motel = MotelEntity(
        fantasia: 'Motel Paradise',
        logo: 'https://example.com/logo.png',
        bairro: 'Downtown',
        distancia: 3.5,
        qtdFavoritos: 10,
        suites: [
          SuiteEntity(
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
          ),
        ],
        qtdAvaliacoes: 100,
        media: 4.5,
      );

      expect(motel.fantasia, 'Motel Paradise');
      expect(motel.logo, 'https://example.com/logo.png');
      expect(motel.bairro, 'Downtown');
      expect(motel.distancia, 3.5);
      expect(motel.qtdFavoritos, 10);
      expect(motel.suites.length, 1);
      expect(motel.qtdAvaliacoes, 100);
      expect(motel.media, 4.5);
    });

    test('Should compare two instances correctly (Equatable)', () {
      const motel1 = MotelEntity(
        fantasia: 'Motel Paradise',
        logo: 'https://example.com/logo.png',
        bairro: 'Downtown',
        distancia: 3.5,
        qtdFavoritos: 10,
        suites: [],
        qtdAvaliacoes: 100,
        media: 4.5,
      );

      const motel2 = MotelEntity(
        fantasia: 'Motel Paradise',
        logo: 'https://example.com/logo.png',
        bairro: 'Downtown',
        distancia: 3.5,
        qtdFavoritos: 10,
        suites: [],
        qtdAvaliacoes: 100,
        media: 4.5,
      );

      const motel3 = MotelEntity(
        fantasia: 'Motel Sunset',
        logo: 'https://example.com/logo2.png',
        bairro: 'Suburbs',
        distancia: 5.0,
        qtdFavoritos: 20,
        suites: [],
        qtdAvaliacoes: 200,
        media: 4.8,
      );

      expect(motel1, equals(motel2));
      expect(motel1, isNot(equals(motel3)));
    });

    test('Should return the correct props', () {
      const motel = MotelEntity(
        fantasia: 'Motel Dream',
        logo: 'https://example.com/logo3.png',
        bairro: 'Uptown',
        distancia: 2.0,
        qtdFavoritos: 5,
        suites: [],
        qtdAvaliacoes: 50,
        media: 4.2,
      );

      expect(motel.props, [
        'Motel Dream',
        'https://example.com/logo3.png',
        'Uptown',
        2.0,
        5,
        [],
        50,
        4.2,
      ]);
    });
  });
}

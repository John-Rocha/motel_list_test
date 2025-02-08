import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motel_list_test/data/datasource/motel_datasource.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';
import 'package:motel_list_test/domain/repositories/motel_repository.dart';

class MockMotelDatasource extends Mock implements MotelDatasource {}

void main() {
  late MotelDatasource datasource;
  late MotelRepository repository;

  setUp(() {
    datasource = MockMotelDatasource();
    repository = MotelRepositoryImpl(datasource: datasource);
  });

  test('Should return Right(MotelResponseEntity) when fetchMotelData succeeds',
      () async {
    final motelResponse = MotelResponseEntity(
      sucesso: true,
      data: MotelDataEntity(
        pagina: 1,
        qtdPorPagina: 10,
        totalSuites: 5,
        totalMoteis: 2,
        raio: 10,
        maxPaginas: 2.0,
        moteis: [],
      ),
      mensagem: [],
    );

    when(() => datasource.fetchMotelData())
        .thenAnswer((_) async => motelResponse);

    final result = await repository.fetchMotelData();

    expect(result, Right(motelResponse));
    verify(() => datasource.fetchMotelData()).called(1);
  });

  test('Should return Left(HttpException) when datasource throws HttpException',
      () async {
    final exception = HttpException('Failed request');

    when(() => datasource.fetchMotelData()).thenThrow(exception);

    final result = await repository.fetchMotelData();

    expect(result, isA<Left<Exception, MotelResponseEntity>>());
    expect(result.fold((l) => l, (r) => null), isA<HttpException>());

    verify(() => datasource.fetchMotelData()).called(1);
  });

  test('Should return Left(Exception) when datasource throws an unknown error',
      () async {
    when(() => datasource.fetchMotelData()).thenThrow(Exception('Unknown'));

    final result = await repository.fetchMotelData();

    expect(result, isA<Left<Exception, MotelResponseEntity>>());
    verify(() => datasource.fetchMotelData()).called(1);
  });
}

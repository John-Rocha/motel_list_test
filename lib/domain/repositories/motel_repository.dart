import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:motel_list_test/data/datasource/motel_datasource.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';

typedef MotelResult = Future<Either<Exception, MotelResponseEntity>>;

abstract interface class MotelRepository {
  MotelResult fetchMotelData();
}

final class MotelRepositoryImpl implements MotelRepository {
  final MotelDatasource _datasource;

  const MotelRepositoryImpl({required MotelDatasource datasource})
      : _datasource = datasource;

  @override
  MotelResult fetchMotelData() async {
    try {
      final result = await _datasource.fetchMotelData();
      return Right(result);
    } on HttpException catch (e, s) {
      log('HttpException: $e', stackTrace: s);
      return Left(e);
    } catch (e, s) {
      log('Exception: $e', stackTrace: s);
      return Left(Exception('Erro ao buscar dados do motel'));
    }
  }
}

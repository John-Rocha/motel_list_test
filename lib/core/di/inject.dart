import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:motel_list_test/data/datasource/motel_datasource.dart';
import 'package:motel_list_test/domain/repositories/motel_repository.dart';

import 'package:motel_list_test/presenter/cubit/motels_home_cubit.dart';

final getIt = GetIt.I;

Future<void> inject() async {
  getIt.registerLazySingleton<HttpClient>(() => HttpClient());

  getIt.registerLazySingleton<MotelDatasource>(
    () => MotelDatasourceImpl(
      httpClient: getIt.get<HttpClient>(),
    ),
  );
  getIt.registerLazySingleton<MotelRepository>(
    () => MotelRepositoryImpl(
      datasource: getIt.get<MotelDatasource>(),
    ),
  );

  getIt.registerSingleton(
    MotelsHomeCubit(motelRepository: getIt.get<MotelRepository>()),
  );
}

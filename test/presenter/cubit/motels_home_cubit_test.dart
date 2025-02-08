import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motel_list_test/domain/entities/motel_data_entity.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';
import 'package:motel_list_test/domain/repositories/motel_repository.dart';
import 'package:motel_list_test/presenter/cubit/motels_home_cubit.dart';

class MockMotelRepository extends Mock implements MotelRepository {}

void main() {
  late MotelsHomeCubit cubit;
  late MotelRepository mockMotelRepository;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    cubit = MotelsHomeCubit(motelRepository: mockMotelRepository);
  });

  const motelResponse = MotelResponseEntity(
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

  test('Initial state should be MotelsHomeLoading', () {
    expect(cubit.state, isA<MotelsHomeLoading>());
  });

  blocTest<MotelsHomeCubit, MotelsHomeState>(
    'Should emit [MotelsHomeLoaded] when fetchMotelData succeeds',
    build: () {
      when(() => mockMotelRepository.fetchMotelData())
          .thenAnswer((_) async => const Right(motelResponse));
      return cubit;
    },
    act: (cubit) => cubit.fetchMotelData(),
    expect: () => [
      const MotelsHomeLoaded(motelResponse: motelResponse),
    ],
  );

  blocTest<MotelsHomeCubit, MotelsHomeState>(
    'Should emit [MotelsHomeError] when fetchMotelData fails',
    build: () {
      when(() => mockMotelRepository.fetchMotelData())
          .thenAnswer((_) async => Left(Exception('Erro ao buscar dados')));
      return cubit;
    },
    act: (cubit) => cubit.fetchMotelData(),
    expect: () => [
      const MotelsHomeError(message: 'Erro ao buscar dados do motel'),
    ],
  );
}

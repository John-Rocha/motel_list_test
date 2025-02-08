import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel_list_test/domain/entities/motel_response_entity.dart';
import 'package:motel_list_test/domain/repositories/motel_repository.dart';

part 'motels_home_state.dart';

class MotelsHomeCubit extends Cubit<MotelsHomeState> {
  final MotelRepository _motelRepository;

  MotelsHomeCubit({
    required MotelRepository motelRepository,
  })  : _motelRepository = motelRepository,
        super(MotelsHomeLoading());

  Future<void> fetchMotelData() async {
    final result = await _motelRepository.fetchMotelData();

    result.fold(
      (_) => emit(MotelsHomeError(message: 'Erro ao buscar dados do motel')),
      (motelResponse) => emit(MotelsHomeLoaded(motelResponse: motelResponse)),
    );
  }
}

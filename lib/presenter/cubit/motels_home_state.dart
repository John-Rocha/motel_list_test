part of 'motels_home_cubit.dart';

sealed class MotelsHomeState extends Equatable {
  const MotelsHomeState();

  @override
  List<Object> get props => [];
}

final class MotelsHomeLoading extends MotelsHomeState {}

final class MotelsHomeError extends MotelsHomeState {
  final String message;

  const MotelsHomeError({required this.message});

  @override
  List<Object> get props => [message];
}

final class MotelsHomeLoaded extends MotelsHomeState {
  final MotelResponseEntity motelResponse;

  const MotelsHomeLoaded({required this.motelResponse});

  @override
  List<Object> get props => [motelResponse];
}

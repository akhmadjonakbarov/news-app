part of 'sliders_cubit.dart';

@immutable
abstract class SlidersState {}

class SlidersInitial extends SlidersState {}

class SlidersLoading extends SlidersState {}

class SlidersLoaded extends SlidersState {
  final List<Slider> sliders;
  SlidersLoaded({required this.sliders});
}

class SlidersError extends SlidersState {
  final String errorMsg;
  SlidersError({required this.errorMsg});
}

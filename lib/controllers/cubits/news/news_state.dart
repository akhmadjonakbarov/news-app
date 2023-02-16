part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<model.New> news;
  NewsLoaded({required this.news});
}

class NewsError extends NewsState {
  final String errorMsg;
  NewsError({required this.errorMsg});
}

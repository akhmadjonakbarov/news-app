part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<model.Category> categories;
  CategoriesLoaded({required this.categories});
}

class CategoriesError extends CategoriesState {
  final String errorMessage;
  CategoriesError({required this.errorMessage});
}

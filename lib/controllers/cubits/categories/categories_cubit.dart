import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:news_app/controllers/api/api.dart';

import '../../../models/models.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesInitial());
    List<Category> categories = [];
    try {
      Uri url = Uri.parse(Api.mobileApp + Api.newsEndPoint);
      http.Response response = await http.get(url);

      var resData = await jsonDecode(response.body);
      for (Map<String, dynamic> category in resData) {
        categories.add(Category(
            id: category['id'],
            name: category['name'],
            news: category['news'],
            description: category['description']));
      }

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(errorMessage: e.toString()));
    }
  }
}

void main(List<String> args) {
  CategoriesCubit categoriesCubit = CategoriesCubit();
  categoriesCubit.getCategories();
}

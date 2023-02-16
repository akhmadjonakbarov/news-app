import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../api/api.dart';

import '../../../models/models.dart' as model;
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getCategories() async {
    List<model.Category> categories = [];
    emit(CategoriesInitial());
    Uri url = Uri.parse(Api.getCategoriesUrl);
    try {
      http.Response response = await http.get(url);
      var resData = jsonDecode(response.body);
      for (Map<String, dynamic> category in resData) {
        categories.add(model.Category.fromMap(category));
      }
      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(
        CategoriesError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/controllers/api/api.dart';
import 'package:http/http.dart' as http;
import '../../../models/models.dart' as model;
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews({int? categoryId}) async {
    List<model.New> news = [];
    Uri url = Uri.parse(
      Api.newsQueryUrl(hasVideo: true, categoryId: categoryId),
    );
    try {
      emit(NewsLoading());
      http.Response response = await http.get(url);
      var resData = jsonDecode(response.body);
      for (Map<String, dynamic> _new in resData) {
        model.New new_ = model.New(
            id: _new['id'],
            title: _new['title'],
            description: _new['description'],
            images: _new['images'],
            created_on: _new['created_on'],
            updated_on: _new['updated_on']);
        news.add(new_);
      }
      emit(
        NewsLoaded(news: news),
      );
    } catch (e) {
      emit(
        NewsError(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}

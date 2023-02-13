import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/controllers/api/api.dart';
import 'package:news_app/models/models.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  Future<void> getComments({required int newId}) async {
    List<Comment> comments = [];
    emit(CommentsLoading());
    Uri url = Uri.parse(Api.commentsQueryUrl(newId: newId));
    try {
      http.Response response = await http.get(url);
      var resData = jsonDecode(response.body);
      for (Map<String, dynamic> comment in resData) {
        comments.add(Comment.fromMap(comment));
      }
    } catch (e) {
      emit(CommentsError(errorMsg: e.toString()));
    }
  }
}

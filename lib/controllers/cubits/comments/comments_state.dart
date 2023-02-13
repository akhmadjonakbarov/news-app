part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comment> comments;
  CommentsLoaded({required this.comments});
}

class CommentsError extends CommentsState {
  final String errorMsg;
  CommentsError({required this.errorMsg});
}

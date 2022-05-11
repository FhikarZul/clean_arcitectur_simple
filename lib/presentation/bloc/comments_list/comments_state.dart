part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();
}

class CommentsListInitial extends CommentsState {
  @override
  List<Object> get props => [];
}

class CommentsListLoading extends CommentsState {
  @override
  List<Object?> get props => [];
}

class CommentsListHasData extends CommentsState {
  final List<Comments> dataComments;

  const CommentsListHasData({
    required this.dataComments,
  });

  @override
  List<Object?> get props => [dataComments];
}

class CommentsListError extends CommentsState {
  final String message;

  const CommentsListError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

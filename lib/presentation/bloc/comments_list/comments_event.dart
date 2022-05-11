part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
}

class CommentsListInit extends CommentsEvent {
  @override
  List<Object?> get props => [];
}

import 'package:bloc/bloc.dart';
import 'package:clean_arcitectur_simple/domain/model/comments.dart';
import 'package:clean_arcitectur_simple/domain/usecase/get_comments_usecase.dart';
import 'package:equatable/equatable.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUsecase getCommentsUsecase;

  CommentsBloc(this.getCommentsUsecase) : super(CommentsListInitial()) {
    on<CommentsListInit>((event, emit) async {
      emit(CommentsListLoading());

      final result = await getCommentsUsecase.execute();
      result.fold(
        (exception) => emit(const CommentsListError(message: 'Error')),
        (data) => emit(CommentsListHasData(dataComments: data)),
      );
    });
  }
}

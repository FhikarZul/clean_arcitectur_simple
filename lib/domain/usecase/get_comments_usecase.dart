import 'package:clean_arcitectur_simple/domain/model/comments.dart';
import 'package:clean_arcitectur_simple/domain/repository/comments_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentsUsecase {
  final CommentsRepository commentsRepository;

  const GetCommentsUsecase({required this.commentsRepository});

  Future<Either<Exception, List<Comments>>> execute() {
    return commentsRepository.getCommentsList();
  }
}

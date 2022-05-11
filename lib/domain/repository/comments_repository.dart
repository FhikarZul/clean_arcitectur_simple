import 'package:clean_arcitectur_simple/domain/model/comments.dart';
import 'package:dartz/dartz.dart';

abstract class CommentsRepository {
  Future<Either<Exception, List<Comments>>> getCommentsList();
}

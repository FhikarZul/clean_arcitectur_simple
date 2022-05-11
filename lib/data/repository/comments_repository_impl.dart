import 'package:clean_arcitectur_simple/data/datasource/comments_remote_data_source.dart';
import 'package:clean_arcitectur_simple/domain/model/comments.dart';
import 'package:clean_arcitectur_simple/domain/repository/comments_repository.dart';
import 'package:dartz/dartz.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final CommentsRemoteDataSource commentsRemoteDataSource;

  CommentsRepositoryImpl({required this.commentsRemoteDataSource});

  @override
  Future<Either<Exception, List<Comments>>> getCommentsList() async {
    try {
      final result = await commentsRemoteDataSource.getCommentsList();
      final commentsList = result.map((e) => e.commentsDomainModel()).toList();

      return Right(commentsList);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

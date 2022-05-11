import 'package:clean_arcitectur_simple/data/datasource/comments_remote_data_source.dart';
import 'package:clean_arcitectur_simple/data/repository/comments_repository_impl.dart';
import 'package:clean_arcitectur_simple/domain/repository/comments_repository.dart';
import 'package:clean_arcitectur_simple/domain/usecase/get_comments_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void initInjection() {
  //http client inject
  locator.registerLazySingleton<http.Client>(() => http.Client());

  //remote data source inject
  locator.registerLazySingleton<CommentsRemoteDataSource>(
    () => CommentsRemoteDataSourceImpl(client: locator.get()),
  );

  //repository inject
  locator.registerLazySingleton<CommentsRepository>(
    () => CommentsRepositoryImpl(commentsRemoteDataSource: locator.get()),
  );

  //usecase
  locator.registerFactory(
      () => GetCommentsUsecase(commentsRepository: locator.get()));
}

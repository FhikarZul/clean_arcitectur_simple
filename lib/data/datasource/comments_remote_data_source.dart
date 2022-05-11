import 'package:clean_arcitectur_simple/data/model/comments_list_response.dart';
import 'package:clean_arcitectur_simple/data/model/comments_response.dart';
import 'package:http/http.dart' as http;

abstract class CommentsRemoteDataSource {
  Future<List<CommentsResponse>> getCommentsList();
}

class CommentsRemoteDataSourceImpl extends CommentsRemoteDataSource {
  final http.Client client;

  CommentsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<CommentsResponse>> getCommentsList() async {
    final result = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (result.statusCode == 200) {
      return CommentsListResponse.fromJson(result.body).commentsListResponse;
    } else {
      throw Exception('Failed to get comments');
    }
  }
}

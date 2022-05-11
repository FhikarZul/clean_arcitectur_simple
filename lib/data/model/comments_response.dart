import 'package:clean_arcitectur_simple/domain/model/comments.dart';

class CommentsResponse {
  String name;
  String email;
  String body;

  CommentsResponse({
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      CommentsResponse(
        name: json['name'],
        email: json['email'],
        body: json['body'],
      );

  //comment model from domain
  Comments commentsDomainModel() => Comments(
        name: name,
        email: email,
        body: body,
      );
}

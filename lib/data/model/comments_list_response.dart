import 'dart:convert';

import 'package:clean_arcitectur_simple/data/model/comments_response.dart';

class CommentsListResponse {
  final List<CommentsResponse> commentsListResponse;

  CommentsListResponse({required this.commentsListResponse});

  factory CommentsListResponse.fromJson(String json) => CommentsListResponse(
        commentsListResponse: List<CommentsResponse>.from(
          jsonDecode(json).map(
            (e) => CommentsResponse.fromJson(e),
          ),
        ),
      );
}

import 'dart:convert';

import 'package:test_task/models/path_result.dart';
import 'package:test_task/models/post_response.dart';
import 'package:test_task/services/api_response.dart';
import 'package:test_task/services/post_service.dart';
import 'package:http/http.dart' as http;

class PathResultService implements PostService<List<PathResult>, PostResponse> {
  static const String url = 'https://flutter.webspark.dev/flutter/api';

  @override
  Future<ApiResponse<PostResponse>> sendData(List<PathResult> data) async {
    var jsonBody = jsonEncode(data.map((value) => value.toMap()).toList());
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final postResponse = PostResponse.fromJson(responseBody);

        return Success<PostResponse>(data: postResponse);
      } else {
        return Error<PostResponse>(
          error: 'Failed to send data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      return Error<PostResponse>(error: 'An error occurred: $e');
    }
  }
}

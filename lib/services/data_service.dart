import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task/models/response.dart';
import 'package:test_task/services/api_response.dart';
import 'package:test_task/services/get_service.dart';

class ResponseService implements GetService<Response> {
  @override
  Future<ApiResponse<Response>> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['error'] == false) {
          Response dataList = Response.fromJson(jsonResponse);

          return Success(data: dataList);
        } else {
          return Error(error: jsonResponse['message']);
        }
      } else {
        return Error(error: 'Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      return Error(error: 'An error occurred: $e');
    }
  }
}

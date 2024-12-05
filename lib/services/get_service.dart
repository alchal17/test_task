import 'package:test_task/services/api_response.dart';

abstract class GetService<T> {
  Future<ApiResponse<T>> fetchData(String url);
}

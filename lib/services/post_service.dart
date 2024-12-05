import 'package:test_task/services/api_response.dart';

abstract class PostService<T, E> {
  Future<ApiResponse<E>> sendData(T data);
}

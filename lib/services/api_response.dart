sealed class ApiResponse<T> {}

class Success<T> extends ApiResponse<T> {
  final T _data;

  T get data => _data;

  Success({required T data}) : _data = data;
}

class Error<T> extends ApiResponse<T> {
  final String _error;

  String get error => _error;

  Error({required String error}) : _error = error;
}

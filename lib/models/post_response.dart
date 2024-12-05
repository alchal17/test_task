class PostResponseData {
  final String _id;
  final bool _correct;

  PostResponseData(this._id, this._correct);

  String get id => _id;
  bool get correct => _correct;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': _id,
      'correct': _correct,
    };
  }

  factory PostResponseData.fromMap(Map<String, dynamic> map) {
    return PostResponseData(
      map['id'] as String,
      map['correct'] as bool,
    );
  }
}

class PostResponse {
  final bool _error;
  final String _message;
  final List<PostResponseData> _data;

  PostResponse(this._error, this._message, this._data);

  bool get error => _error;
  String get message => _message;
  List<PostResponseData> get data => _data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': _error,
      'message': _message,
      'data': (_data as List<dynamic>)
          .map((element) =>
              PostResponse.fromJson(element as Map<String, dynamic>))
          .toList(),
    };
  }

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        json['error'],
        json['message'],
        (json['data'] as List<dynamic>)
            .map((e) => PostResponseData.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
}

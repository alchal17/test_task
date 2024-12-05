import 'package:test_task/models/data.dart';

class Response {
  final bool _error;
  final String _message;
  final List<Data> _data;

  Response(this._error, this._message, this._data);

  bool get error => _error;

  String get message => _message;

  List<Data> get data => _data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
      json['error'],
      json['message'],
      (json['data'] as List).map((element) => Data.fromJson(element)).toList());
}

import 'package:test_task/models/coordinates.dart';

class Data {
  final String _id;
  final List<String> _field;
  final Coordinates _start;
  final Coordinates _end;

  Data(this._id, this._field, this._start, this._end);

  String get id => _id;

  List<String> get field => _field;

  Coordinates get start => _start;

  Coordinates get end => _end;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        json['id'],
        List<String>.from(json['field']),
        Coordinates.fromJson(json['start']),
        Coordinates.fromJson(json['end']),
      );
}

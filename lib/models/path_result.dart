import 'package:test_task/models/coordinates.dart';

class Result {
  final List<Coordinates> _steps;
  final String _path;

  Result(this._steps, this._path);

  List<Coordinates> get steps => _steps;
  String get path => _path;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'steps': _steps.map((x) => x.toStringMap()).toList(),
      'path': _path,
    };
  }
}

class PathResult {
  final String _id;
  final Result _result;

  PathResult(this._id, this._result);

  String get id => _id;

  Result get result => _result;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': _id,
      'result': _result.toMap(),
    };
  }
}

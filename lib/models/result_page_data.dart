import 'package:test_task/models/coordinates.dart';
import 'package:test_task/scripts/cell_generator.dart';

class ResultPageData {
  final List<List<Cell>> _grid;
  final List<Coordinates> _path;
  final Coordinates _start;
  final Coordinates _end;

  ResultPageData(this._grid, this._path, this._start, this._end);

  List<List<Cell>> get grid => _grid;
  List<Coordinates> get path => _path;
  Coordinates get start => _start;
  Coordinates get end => _end;

}

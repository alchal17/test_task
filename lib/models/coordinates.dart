import 'dart:convert';

class Coordinates {
  final int _x;
  final int _y;

  Coordinates(this._x, this._y);

  int get x => _x;

  int get y => _y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinates &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      Coordinates(json['x'], json['y']);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': _x,
      'y': _y,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      map['x'] as int,
      map['y'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => '($_x,$_y)';

  Map<String, String> toStringMap() => {'x': _x.toString(), 'y': _y.toString()};
}

import 'package:test_task/models/coordinates.dart';
import 'package:test_task/scripts/cell_generator.dart';

List<Coordinates> calculateShortestPath(
  List<List<Cell>> field,
  Coordinates start,
  Coordinates end,
) {
  final rows = field.length;
  final cols = field[0].length;

  final directions = [
    Coordinates(0, 1),
    Coordinates(1, 0),
    Coordinates(0, -1),
    Coordinates(-1, 0),
    Coordinates(-1, -1),
    Coordinates(-1, 1),
    Coordinates(1, -1),
    Coordinates(1, 1),
  ];

  final queue = <List<dynamic>>[
    [
      start,
      [start]
    ]
  ];
  final visited = <Coordinates>{start};

  while (queue.isNotEmpty) {
    final current = queue.removeAt(0);
    final currentCoord = current[0] as Coordinates;
    final path = current[1] as List<Coordinates>;

    if (currentCoord == end) {
      return path;
    }

    for (final direction in directions) {
      final nx = currentCoord.x + direction.x;
      final ny = currentCoord.y + direction.y;

      if (nx >= 0 &&
          ny >= 0 &&
          nx < rows &&
          ny < cols &&
          field[nx][ny] != Cell.blocked) {
        final neighbor = Coordinates(nx, ny);

        if (visited.add(neighbor)) {
          queue.add([
            neighbor,
            [...path, neighbor]
          ]);
        }
      }
    }
  }

  return [];
}

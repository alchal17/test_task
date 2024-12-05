enum Cell { blocked, empty }

List<List<Cell>> getGrid(List<String> values) {
  List<List<Cell>> result = [];

  for (String row in values) {
    List<Cell> rowCells = row
        .split('')
        .map((cell) => cell == 'X' ? Cell.blocked : Cell.empty)
        .toList();

    result.add(rowCells);
  }

  return result;
}

import 'package:flutter/material.dart';
import 'package:test_task/models/coordinates.dart';
import 'package:test_task/models/result_page_data.dart';
import 'package:test_task/scripts/cell_generator.dart';
import 'package:test_task/view/colors.dart';
import 'package:test_task/view/elements/grid_cell.dart';

class PreviewScreenGrid extends StatelessWidget {
  final ResultPageData _resultPageData;

  const PreviewScreenGrid(this._resultPageData, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _resultPageData.grid[0].length,
        childAspectRatio: 1.0,
      ),
      itemCount: _resultPageData.grid.length * _resultPageData.grid[0].length,
      itemBuilder: (context, index) {
        int row = index ~/ _resultPageData.grid[0].length;
        int col = index % _resultPageData.grid[0].length;

        Color cellColor = emptyCellColor;

        if (_resultPageData.grid[row][col] == Cell.blocked) {
          cellColor = blockedCellColor;
        } else if (_resultPageData.start == Coordinates(col, row)) {
          cellColor = initialCellColor;
        } else if (_resultPageData.end == Coordinates(col, row)) {
          cellColor = finalCellColor;
        } else if (_resultPageData.path
            .any((value) => value == Coordinates(col, row))) {
          cellColor = shortedPathCellColor;
        }

        return GridCell(cellColor, col, row);
      },
    );
  }
}

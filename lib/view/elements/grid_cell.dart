import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  final Color _color;
  final int _column;
  final int _row;
  const GridCell(this._color, this._column, this._row, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      color: _color,
      child: Center(
        child: Text('($_column,$_row)'),
      ),
    );
  }
}

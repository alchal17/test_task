import 'package:flutter/material.dart';
import 'package:test_task/models/result_page_data.dart';

class ResultScreenElement extends StatelessWidget {
  final ResultPageData _resultPageData;
  final VoidCallback _onTap;
  const ResultScreenElement(this._resultPageData, this._onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(_resultPageData.path.join('->')),
        ),
      ),
    );
  }
}
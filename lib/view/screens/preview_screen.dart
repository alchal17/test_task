import 'package:flutter/material.dart';
import 'package:test_task/models/result_page_data.dart';
import 'package:test_task/view/colors.dart';
import 'package:test_task/view/elements/preview_screen_grid.dart';

class PreviewScreen extends StatelessWidget {
  final ResultPageData _resultPageData;

  const PreviewScreen(this._resultPageData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Preview screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          PreviewScreenGrid(_resultPageData),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _resultPageData.path.join('->'),
            ),
          ),
        ],
      ),
    );
  }
}

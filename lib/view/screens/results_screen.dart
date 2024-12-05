import 'package:flutter/material.dart';
import 'package:test_task/models/result_page_data.dart';
import 'package:test_task/view/colors.dart';
import 'package:test_task/view/elements/result_screen_element.dart';
import 'package:test_task/view/screens/preview_screen.dart';

class ResultsScreen extends StatelessWidget {
  final List<ResultPageData> _resultPageDataList;

  const ResultsScreen(this._resultPageDataList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Result list screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: _resultPageDataList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ResultScreenElement(_resultPageDataList[index], () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PreviewScreen(_resultPageDataList[index])));
              }),
              if (index != _resultPageDataList.length - 1)
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
            ],
          );
        },
      ),
    );
  }
}

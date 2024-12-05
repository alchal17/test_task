import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/models/data.dart';
import 'package:test_task/models/path_result.dart';
import 'package:test_task/models/post_response.dart';
import 'package:test_task/models/response.dart';
import 'package:test_task/models/result_page_data.dart';
import 'package:test_task/scripts/cell_generator.dart';
import 'package:test_task/scripts/path_finder.dart';
import 'package:test_task/services/api_response.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/services/get_service.dart';
import 'package:test_task/services/post_service.dart';
import 'package:test_task/view/colors.dart';
import 'package:test_task/view/elements/percentage_circle.dart';
import 'package:test_task/view/screens/results_screen.dart';

class ProcessScreen extends StatefulWidget {
  final String _url;

  const ProcessScreen({super.key, required String url}) : _url = url;

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  int _numberOfSolved = 0;

  List<Data> _values = [];

  bool _visible = false;

  final List<ResultPageData> _resultPageDataList = [];

  Future<ApiResponse<Response>>? _fetchResponse;

  final postService =
      GetIt.instance<PostService<List<PathResult>, PostResponse>>(
          instanceName: 'main_path_result_service');

  final getService = GetIt.instance<GetService<Response>>(
      instanceName: 'main_response_service');

  @override
  void initState() {
    super.initState();
    _fetchResponse = getService.fetchData(widget._url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Process Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<ApiResponse<Response>>(
        future: _fetchResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final response = snapshot.data;

            if (response is Success<Response>) {
              _values = response.data.data;
              if (_values.length != _numberOfSolved) {
                List<PathResult> pathResults = [];
                for (Data data in _values) {
                  var gridCells = getGrid(data.field);
                  var path =
                      calculateShortestPath(gridCells, data.start, data.end);
                  var pathResult =
                      PathResult(data.id, Result(path, path.join('->')));
                  pathResults.add(pathResult);
                  var resultPageData =
                      ResultPageData(gridCells, path, data.start, data.end);
                  _resultPageDataList.add(resultPageData);
                }
                postService.sendData(pathResults).then((answerResponse) {
                  if (answerResponse is Success<PostResponse>) {
                    var postResponseDataList = answerResponse.data.data;
                    for (PostResponseData postResponseData
                        in postResponseDataList) {
                      if (postResponseData.correct) {
                        setState(() {
                          _numberOfSolved++;
                        });
                      }
                    }
                  }
                  setState(() {
                    _visible = true;
                  });
                });
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_numberOfSolved != _values.length
                        ? 'Calculating...'
                        : 'All calculations have finished, you can send your results to the server'),
                    const SizedBox(height: 20),
                    Text(
                      '${(_numberOfSolved / _values.length * 100).toInt()}%',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomPaint(
                      size: const Size(200, 200),
                      painter: PercentageCircle(
                          _numberOfSolved / _values.length * 2 * pi),
                    ),
                  ],
                ),
              );
            } else if (response is Error<Response>) {
              return Center(
                child: Text(
                  'Error: ${response.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
          }

          return const Center(child: Text('Unexpected state'));
        },
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _numberOfSolved == _values.length && _visible ? 1 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.blue.shade300,
              shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(color: Color.fromARGB(255, 0, 86, 157)),
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsScreen(_resultPageDataList)));
              },
              label: const Text(
                'Send results to server',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

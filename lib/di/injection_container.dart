import 'package:get_it/get_it.dart';
import 'package:test_task/models/path_result.dart';
import 'package:test_task/models/post_response.dart';
import 'package:test_task/models/response.dart';
import 'package:test_task/services/get_service.dart';
import 'package:test_task/services/data_service.dart';
import 'package:test_task/services/path_result_service.dart';
import 'package:test_task/services/post_service.dart';

final locator = GetIt.instance;

void setupDependencyContainer() {
  locator.registerSingleton<GetService<Response>>(ResponseService(),
      instanceName: 'main_response_service');

  locator.registerSingleton<PostService<List<PathResult>, PostResponse>>(
      PathResultService(),
      instanceName: 'main_path_result_service');
}

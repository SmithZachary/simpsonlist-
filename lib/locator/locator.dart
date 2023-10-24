import 'package:get_it/get_it.dart';
import 'package:viewer/feature/viewer/data/repository/viewer_repo_impl.dart';
import 'package:viewer/feature/viewer/domain/repository/viewer_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ViewerRepo>(ViewerRepoImpl());
}

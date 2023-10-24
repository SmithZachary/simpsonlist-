import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:viewer/feature/viewer/domain/repository/viewer_repo.dart';

class MockViewerRepo extends Mock implements ViewerRepo {}

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ViewerRepo>(MockViewerRepo());
}

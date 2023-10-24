import 'package:viewer/feature/viewer/domain/model/viewer.dart';

abstract class ViewerRepo {
  Future<Viewer?> fetchViewer();
}

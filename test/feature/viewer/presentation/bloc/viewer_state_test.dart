import 'package:flutter_test/flutter_test.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';

void main() {
  group('ViewerState', () {
    final viewer = Viewer();

    test('Should_ReturnSameObjectValue_When_ViewerIsPassed', () {
      expect(
        const ViewerState().copyWith(viewer: viewer),
        equals(
          ViewerState(viewer: viewer),
        ),
      );
    });

    test('Should_ReturnSameObjectValue_When_StatusIsPassed', () {
      expect(
        const ViewerState().copyWith(status: Status.loading),
        equals(
          const ViewerState(status: Status.loading),
        ),
      );
    });

    test('Should_ReturnSameObjectValue_When_SearchStringIsPassed', () {
      expect(
        const ViewerState().copyWith(searchString: 'test'),
        equals(
          const ViewerState(searchString: 'test'),
        ),
      );
    });
  });
}

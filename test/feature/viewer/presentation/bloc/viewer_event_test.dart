import 'package:flutter_test/flutter_test.dart';
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';

void main() {
  group('ViewerEvent', () {
    group('FetchViewer', () {
      test('supports value comparisons', () {
        expect(
          const FetchViewer(),
          equals(const FetchViewer()),
        );
      });
    });

    group('SearchViewer', () {
      test('supports value comparisons', () {
        expect(
          const SearchViewer(),
          equals(
            const SearchViewer(),
          ),
        );
      });
    });
  });
}

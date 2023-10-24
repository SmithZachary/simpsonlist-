import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/domain/repository/viewer_repo.dart';
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';

import '../../../../locator/injector.dart';
import '../../../../mock/viewer_data.dart';

void main() {
  final viewer = Viewer.fromJson(mockData);
  final searchViewer = viewer.relatedTopics
      ?.firstWhere((element) => element.result?.contains('Bender') ?? false);

  setUpAll(() {
    setup();
  });

  group('ViewerBloc', () {
    blocTest<ViewerBloc, ViewerState>(
      'Should_returnViewer_'
      'When_FetchViewer',
      build: () {
        when(() => getIt<ViewerRepo>().fetchViewer())
            .thenAnswer((invocation) => Future.value(viewer));
        return ViewerBloc();
      },
      act: (bloc) => bloc.add(const FetchViewer()),
      expect: () => <ViewerState>[
        const ViewerState(status: Status.loading),
        ViewerState(viewer: viewer, status: Status.success),
      ],
    );

    blocTest<ViewerBloc, ViewerState>(
      'Should_throwException_'
      'When_FetchViewer',
      build: () {
        when(() => getIt<ViewerRepo>().fetchViewer())
            .thenThrow(const HttpException('Something went wrong'));
        return ViewerBloc();
      },
      act: (bloc) => bloc.add(const FetchViewer()),
      expect: () => <ViewerState>[
        const ViewerState(status: Status.loading),
        const ViewerState(
          errorMessage: 'Something went wrong',
          status: Status.error,
        ),
      ],
    );

    blocTest<ViewerBloc, ViewerState>(
      'Should_SearchViewerFromViewerState_'
      'When_SearchViewer',
      build: () {
        when(() => getIt<ViewerRepo>().fetchViewer())
            .thenAnswer((invocation) => Future.value(viewer));
        return ViewerBloc();
      },
      act: (bloc) => bloc
        ..add(const FetchViewer())
        ..add(const SearchViewer(searchString: 'bender')),
      seed: () => const ViewerState(),
      expect: () => <ViewerState>[
        const ViewerState(status: Status.loading),
        ViewerState(viewer: viewer, status: Status.success),
        ViewerState(
          viewer: viewer,
          status: Status.success,
          searchedViewer: [searchViewer!],
          searchString: 'bender',
        ),
      ],
    );

    blocTest<ViewerBloc, ViewerState>(
      'Should_SearchViewerFromViewerState_'
      'When_SearchViewer_with_no_searchString',
      build: () {
        when(() => getIt<ViewerRepo>().fetchViewer())
            .thenAnswer((invocation) => Future.value(viewer));
        return ViewerBloc();
      },
      act: (bloc) => bloc
        ..add(const FetchViewer())
        ..add(const SearchViewer(searchString: 'test viewer')),
      seed: () => const ViewerState(),
      expect: () => <ViewerState>[
        const ViewerState(status: Status.loading),
        ViewerState(viewer: viewer, status: Status.success),
        ViewerState(
          viewer: viewer,
          status: Status.success,
          searchedViewer: const [],
          searchString: 'test viewer',
        ),
      ],
    );
  });
}

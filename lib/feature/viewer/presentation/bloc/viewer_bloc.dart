import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:viewer/core/exception/exception.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/domain/repository/viewer_repo.dart';
import 'package:viewer/locator/locator.dart';

part 'viewer_event.dart';
part 'viewer_state.dart';

class ViewerBloc extends Bloc<ViewerEvent, ViewerState> {
  ViewerBloc() : super(const ViewerState()) {
    on<FetchViewer>(_onFetchViewer);
    on<SearchViewer>(_onSearchViewer);
    on<SelectRelatedTopics>(_onSelectRelatedTopics);
  }

  final ViewerRepo viewerRepo = getIt<ViewerRepo>();

  FutureOr<void> _onFetchViewer(
      FetchViewer event, Emitter<ViewerState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final viewer = await viewerRepo.fetchViewer();
      emit(state.copyWith(viewer: viewer, status: Status.success));
    } on HttpException catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: Status.error));
    } on AppException catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: Status.error));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  FutureOr<void> _onSearchViewer(
      SearchViewer event, Emitter<ViewerState> emit) {
    final List<RelatedTopics> searchRelatedTopics = [];
    state.viewer?.relatedTopics?.forEach((e) {
      if ((e.text
                  ?.toLowerCase()
                  .contains(event.searchString?.toLowerCase() ?? '') ??
              false) ||
          (e.result
                  ?.toLowerCase()
                  .contains(event.searchString?.toLowerCase() ?? '') ??
              false)) {
        searchRelatedTopics.add(e);
      }
    });

    emit(state.copyWith(
      searchString: event.searchString,
      searchedViewer: searchRelatedTopics,
    ));
  }

  FutureOr<void> _onSelectRelatedTopics(
      SelectRelatedTopics event, Emitter<ViewerState> emit) {
    emit(state.copyWith(relatedTopics: event.relatedTopics));
  }
}

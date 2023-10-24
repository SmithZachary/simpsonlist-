part of 'viewer_bloc.dart';

class ViewerState extends Equatable {
  const ViewerState({
    this.viewer,
    this.searchedViewer,
    this.errorMessage,
    this.searchString,
    this.relatedTopics,
    this.status = Status.initial,
  });

  final Viewer? viewer;
  final List<RelatedTopics>? searchedViewer;
  final String? searchString;
  final RelatedTopics? relatedTopics;
  final String? errorMessage;
  final Status status;

  ViewerState copyWith({
    Viewer? viewer,
    List<RelatedTopics>? searchedViewer,
    String? errorMessage,
    String? searchString,
    Status? status,
    RelatedTopics? relatedTopics,
  }) {
    return ViewerState(
      status: status ?? this.status,
      viewer: viewer ?? this.viewer,
      searchedViewer: searchedViewer ?? this.searchedViewer,
      searchString: searchString ?? this.searchString,
      relatedTopics: relatedTopics ?? this.relatedTopics,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        viewer,
        searchedViewer,
        errorMessage,
        status,
        relatedTopics,
        searchString,
      ];
}

enum Status {
  initial,
  loading,
  success,
  error,
}

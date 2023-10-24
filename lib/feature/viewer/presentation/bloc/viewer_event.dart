part of 'viewer_bloc.dart';

abstract class ViewerEvent extends Equatable {
  const ViewerEvent();

  @override
  List<Object?> get props => [];
}

class FetchViewer extends ViewerEvent {
  const FetchViewer();

  @override
  List<Object?> get props => [];
}

class SearchViewer extends ViewerEvent {
  const SearchViewer({this.searchString});

  final String? searchString;

  @override
  List<Object?> get props => [searchString];
}

class SelectRelatedTopics extends ViewerEvent {
  const SelectRelatedTopics(this.relatedTopics);

  final RelatedTopics? relatedTopics;

  @override
  List<Object?> get props => [relatedTopics];
}

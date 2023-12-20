part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchInitialFetchEvent extends SearchEvent {}

class SearchUpdatedFetchEvent extends SearchEvent {
  final String searchString;

  SearchUpdatedFetchEvent({required this.searchString});
}

class SearchIthIndexClickedEvent extends SearchEvent {
  final PostDataModel posts;

  SearchIthIndexClickedEvent({required this.posts});
}

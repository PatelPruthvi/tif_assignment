part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

abstract class SearchActionState extends SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccssfulLoadedState extends SearchState {
  final List<PostDataModel> posts;

  SearchSuccssfulLoadedState({required this.posts});
}

class SearchNavigatetoDetailsActionState extends SearchActionState {
  final PostDataModel post;

  SearchNavigatetoDetailsActionState({required this.post});
}

class SearchLoadingFailedState extends SearchState {
  final String errorMsg;

  SearchLoadingFailedState({required this.errorMsg});
}

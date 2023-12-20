part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

@immutable
sealed class PostsActionState extends PostsState {}

final class PostsInitial extends PostsState {}

class PostsFetchSuccessfulState extends PostsState {
  final List<PostDataModel> postsData;

  PostsFetchSuccessfulState({required this.postsData});
}

class PostsFetchFailedState extends PostsState {
  final String errorMsg;

  PostsFetchFailedState({required this.errorMsg});
}

class PostsFetchLoadingState extends PostsState {}

class PostNavigateToDetailsPageActionState extends PostsActionState {
  final PostDataModel posts;

  PostNavigateToDetailsPageActionState({required this.posts});
}

class PostNavigateToSearchScreenActionState extends PostsActionState {}

part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostInitialFetchEvent extends PostsEvent {}

class PostIthPostClickedEvent extends PostsEvent {
  final PostDataModel postDataModel;

  PostIthPostClickedEvent({required this.postDataModel});
}

class PostsSearchButtonClickedEvent extends PostsEvent {}

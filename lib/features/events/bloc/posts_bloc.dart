import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tif_assignment/models/post_data_model.dart';
import 'package:tif_assignment/repos/repositories.dart';
import 'package:tif_assignment/resources/AppUrl/app_url.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {});
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostIthPostClickedEvent>(postIthPostClickedEvent);
    on<PostsSearchButtonClickedEvent>(postsSearchButtonClickedEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchLoadingState());

    List<PostDataModel> postDataModels =
        await AppRepos.fetchPosts(AppUrl.appUrl);
    if (postDataModels.isNotEmpty) {
      emit(PostsFetchSuccessfulState(postsData: postDataModels));
    } else {
      emit(PostsFetchFailedState(errorMsg: "Unable to retrieve data"));
    }
  }

  FutureOr<void> postIthPostClickedEvent(
      PostIthPostClickedEvent event, Emitter<PostsState> emit) {
    emit(PostNavigateToDetailsPageActionState(posts: event.postDataModel));
  }

  FutureOr<void> postsSearchButtonClickedEvent(
      PostsSearchButtonClickedEvent event, Emitter<PostsState> emit) {
    emit(PostNavigateToSearchScreenActionState());
  }
}

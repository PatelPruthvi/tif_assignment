import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tif_assignment/models/post_data_model.dart';
import 'package:tif_assignment/repos/repositories.dart';
import 'package:tif_assignment/resources/AppUrl/app_url.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
    on<SearchInitialFetchEvent>(searchInitialFetchEvent);
    on<SearchIthIndexClickedEvent>(searchIthIndexClickedEvent);
    on<SearchUpdatedFetchEvent>(searchUpdatedFetchEvent);
  }

  FutureOr<void> searchUpdatedFetchEvent(
      SearchUpdatedFetchEvent event, Emitter<SearchState> emit) async {
    List<PostDataModel> posts =
        await AppRepos.fetchPosts(AppUrl.searchUrl(event.searchString));
    if (posts.isNotEmpty) {
      emit(SearchSuccssfulLoadedState(posts: posts));
    } else {
      emit(SearchLoadingFailedState(errorMsg: "No results found..."));
    }
  }
}

FutureOr<void> searchIthIndexClickedEvent(
    SearchIthIndexClickedEvent event, Emitter<SearchState> emit) {
  emit(SearchNavigatetoDetailsActionState(post: event.posts));
}

FutureOr<void> searchInitialFetchEvent(
    SearchInitialFetchEvent event, Emitter<SearchState> emit) async {
  emit(SearchLoadingState());
  List<PostDataModel> posts = await AppRepos.fetchPosts(AppUrl.appUrl);
  if (posts.isNotEmpty) {
    emit(SearchSuccssfulLoadedState(posts: posts));
  } else {
    emit(SearchLoadingFailedState(errorMsg: "Unable to retrieve data.."));
  }
}

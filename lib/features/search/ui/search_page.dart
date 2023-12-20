import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/features/event_details/ui/event_details_page.dart';
import 'package:tif_assignment/features/search/bloc/search_bloc.dart';
import 'package:tif_assignment/resources/Colors/colors.dart';
import 'package:tif_assignment/resources/dimensions/dimensions.dart';
import 'package:tif_assignment/resources/fonts/fonts.dart';
import 'package:tif_assignment/utilities/utilities.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBloc searchBloc = SearchBloc();
  @override
  void initState() {
    searchBloc.add(SearchInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventInputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: Fonts.getTitleTextStyle(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.getHorizontalPadding(context)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                  cursorColor: AppColours.indigoColor,
                  autocorrect: false,
                  style: Fonts.getTitleTextStyle(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal),
                  controller: eventInputController,
                  onChanged: (value) {
                    searchBloc
                        .add(SearchUpdatedFetchEvent(searchString: value));
                  },
                  decoration: InputDecoration(
                      hintText: '  Type Event Name',
                      hintStyle: Fonts.getTitleTextStyle(context).copyWith(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: AppColours.indigoColor,
                        size: Fonts.getTitleTextStyle(context).fontSize,
                      ))),
              SizedBox(
                height: Dimensions.getScreenHeight(context) * 0.75,
                child: BlocConsumer<SearchBloc, SearchState>(
                  bloc: searchBloc,
                  listenWhen: (previous, current) =>
                      current is SearchActionState,
                  buildWhen: (previous, current) =>
                      current is! SearchActionState,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case SearchSuccssfulLoadedState:
                        final successState =
                            state as SearchSuccssfulLoadedState;
                        return ListView.builder(
                          itemCount: successState.posts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.getTileVerticalPadding(
                                        context)),
                                child: GestureDetector(
                                  onTap: () {
                                    searchBloc.add(SearchIthIndexClickedEvent(
                                        posts: successState.posts[index]));
                                  },
                                  child: Container(
                                    height:
                                        Dimensions.getTileHeight(context) * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.getTileRadius(context)),
                                    ),
                                    child: Row(children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions
                                                  .getHorizontalPadding(
                                                      context),
                                              vertical: Dimensions
                                                  .getTileVerticalPadding(
                                                      context)),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.getTileRadius(
                                                          context)),
                                              child: Image.network(
                                                successState.posts[index]
                                                        .bannerImage ??
                                                    "",
                                                width:
                                                    Dimensions.getScreenWidth(
                                                            context) *
                                                        0.25,
                                                height:
                                                    Dimensions.getScreenHeight(
                                                        context),
                                                fit: BoxFit.fill,
                                              ))),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(
                                            Dimensions.getHorizontalPadding(
                                                context)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Utilities.getDateInSearchScreen(
                                                  successState.posts[index]
                                                          .dateTime ??
                                                      ""),
                                              style:
                                                  Fonts.getTileIndigoTextStyle(
                                                      context),
                                            ),
                                            Text(
                                              successState.posts[index].title ??
                                                  "",
                                              style: Fonts
                                                      .getTileTitleTextStyle(
                                                          context)
                                                  .copyWith(
                                                      fontSize: Dimensions
                                                              .getScreenWidth(
                                                                  context) *
                                                          0.05),
                                            )
                                          ],
                                        ),
                                      ))
                                    ]),
                                  ),
                                ));
                          },
                        );
                      case SearchLoadingState:
                        return Center(
                            child: CircularProgressIndicator(
                                color: AppColours.indigoColor));
                      case SearchLoadingFailedState:
                        final failedState = state as SearchLoadingFailedState;
                        return Center(
                            child: Text(
                          failedState.errorMsg,
                          style:
                              Fonts.getEventDetailsAboutEventTextStyle(context),
                        ));
                      default:
                        return Container();
                    }
                  },
                  listener: (context, state) {
                    if (state is SearchNavigatetoDetailsActionState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventDetailsScreen(posts: state.post)));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

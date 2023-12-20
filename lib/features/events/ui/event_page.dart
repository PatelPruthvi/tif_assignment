import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/features/event_details/ui/event_details_page.dart';
import 'package:tif_assignment/features/events/bloc/posts_bloc.dart';
import 'package:tif_assignment/features/search/ui/search_page.dart';
import 'package:tif_assignment/resources/Colors/colors.dart';
import 'package:tif_assignment/resources/dimensions/dimensions.dart';
import 'package:tif_assignment/resources/fonts/fonts.dart';
import 'package:tif_assignment/utilities/utilities.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(left: 8.0), child: Text("Events")),
          actions: [
            IconButton(
                onPressed: () {
                  postsBloc.add(PostsSearchButtonClickedEvent());
                },
                icon: const Icon(CupertinoIcons.search, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.more_vert_outlined, color: Colors.black)),
            SizedBox(width: Dimensions.getHorizontalPadding(context)),
          ],
        ),
        body: BlocConsumer(
          bloc: postsBloc,
          buildWhen: (previous, current) => current is! PostsActionState,
          listenWhen: (previous, current) => current is PostsActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsFetchLoadingState:
                return Center(
                  child:
                      CircularProgressIndicator(color: AppColours.indigoColor),
                );
              case PostsFetchSuccessfulState:
                final successtate = state as PostsFetchSuccessfulState;
                return Padding(
                  padding:
                      EdgeInsets.all(Dimensions.getHorizontalPadding(context)),
                  child: ListView.builder(
                      itemCount: successtate.postsData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    Dimensions.getTileVerticalPadding(context)),
                            child: GestureDetector(
                              onTap: () {
                                postsBloc.add(PostIthPostClickedEvent(
                                    postDataModel:
                                        successtate.postsData[index]));
                              },
                              child: Container(
                                height: Dimensions.getTileHeight(context),
                                width: Dimensions.getScreenWidth(context),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.getTileRadius(context)),
                                ),
                                child: Row(children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.getTileRadius(
                                                  context)),
                                          child: Image.network(
                                            successtate
                                                .postsData[index].bannerImage!,
                                            width: Dimensions.getScreenWidth(
                                                    context) *
                                                0.2,
                                            height: Dimensions.getScreenHeight(
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
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            Utilities.dateInDayDateMonthFormat(
                                                successtate.postsData[index]
                                                    .dateTime!),
                                            style: Fonts.getTileIndigoTextStyle(
                                                context)),
                                        Text(
                                          successtate.postsData[index].title!,
                                          style: Fonts.getTileTitleTextStyle(
                                              context),
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_pin,
                                                  size:
                                                      Dimensions.getTileHeight(
                                                              context) *
                                                          0.13,
                                                  color: Colors.grey),
                                              Text(
                                                successtate.postsData[index]
                                                    .venueName!,
                                                style: Fonts
                                                    .getTileFooterTextStyle(
                                                        context),
                                              )
                                            ])
                                      ],
                                    ),
                                  ))
                                ]),
                              ),
                            ));
                      }),
                );

              case PostsFetchFailedState:
                final failedState = state as PostsFetchFailedState;
                return Center(
                  child: Text(
                    failedState.errorMsg,
                    style: Fonts.getEventDetailsCompanyNameStyle(context),
                  ),
                );
              default:
                return Container();
            }
          },
          listener: (context, state) {
            if (state is PostNavigateToDetailsPageActionState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EventDetailsScreen(posts: state.posts)));
            } else if (state is PostNavigateToSearchScreenActionState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            }
          },
        ));
  }
}

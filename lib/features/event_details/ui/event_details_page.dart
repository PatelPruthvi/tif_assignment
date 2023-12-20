import 'package:flutter/material.dart';
import 'package:tif_assignment/models/post_data_model.dart';
import 'package:tif_assignment/resources/Colors/colors.dart';
import 'package:tif_assignment/resources/dimensions/dimensions.dart';
import 'package:tif_assignment/resources/fonts/fonts.dart';
import 'package:tif_assignment/utilities/utilities.dart';

class EventDetailsScreen extends StatelessWidget {
  final PostDataModel posts;
  const EventDetailsScreen({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Image.network(
              posts.bannerImage ?? "",
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
            AppBar(
              title: Text(
                "Event Details",
                style: Fonts.getTitleTextStyle(context)
                    .copyWith(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                IconButton(
                    onPressed: () {},
                    splashRadius: 0.4,
                    icon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColours.transparentWhiteColor),
                      width: Dimensions.getBookmarkSideValue(context),
                      height: Dimensions.getBookmarkSideValue(context),
                      child: const Icon(Icons.bookmark, color: Colors.white),
                    )),
                SizedBox(width: Dimensions.getHorizontalPadding(context))
              ],
            ),
          ]),
          SizedBox(height: Dimensions.getTileVerticalPadding(context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.getHorizontalPadding(context) * 2.5,
                vertical: Dimensions.getHorizontalPadding(context)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts.title ?? "",
                    style: Fonts.getEventDetailsTitleTextStyle(context),
                  ),
                  SizedBox(
                    height: Dimensions.getScreenHeight(context) / 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                posts.organiserIcon ?? "",
                                width: Dimensions.getLogoSize(context),
                                height: Dimensions.getLogoSize(context),
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: AppColours.indigoColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.getTileRadius(context))),
                                    width: Dimensions.getLogoSize(context),
                                    height: Dimensions.getLogoSize(context),
                                    child: const Icon(Icons.not_interested),
                                  );
                                },
                              ),
                              SizedBox(
                                  width:
                                      Dimensions.getHorizontalPadding(context) *
                                          2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    posts.organiserName ?? "",
                                    style:
                                        Fonts.getEventDetailsCompanyNameStyle(
                                            context),
                                  ),
                                  SizedBox(
                                      height: Dimensions.getTileVerticalPadding(
                                          context)),
                                  Text(
                                    "Organizer",
                                    style:
                                        Fonts.getTileFooterTextStyle(context),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(children: [
                            Container(
                              height: Dimensions.getLogoSize(context),
                              width: Dimensions.getLogoSize(context),
                              decoration: BoxDecoration(
                                  color:
                                      AppColours.indigoColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.getTileRadius(context))),
                              child: Icon(Icons.calendar_month,
                                  size: Dimensions.getLogoSize(context) / 2.2,
                                  color: AppColours.indigoColor),
                            ),
                            SizedBox(
                                width:
                                    Dimensions.getHorizontalPadding(context) *
                                        2),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utilities.dateINDDMMMYYYformat(
                                        posts.dateTime!),
                                    style:
                                        Fonts.getEventDetailsCompanyNameStyle(
                                                context)
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                      height: Dimensions.getTileVerticalPadding(
                                          context)),
                                  Text(
                                    Utilities.getDayAndTime(
                                        posts.dateTime ?? ""),
                                    style:
                                        Fonts.getTileFooterTextStyle(context),
                                  )
                                ])
                          ]),
                          Row(children: [
                            Container(
                              height: Dimensions.getLogoSize(context),
                              width: Dimensions.getLogoSize(context),
                              decoration: BoxDecoration(
                                  color:
                                      AppColours.indigoColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.getTileRadius(context))),
                              child: Icon(Icons.location_on,
                                  size: Dimensions.getLogoSize(context) / 2.2,
                                  color: AppColours.indigoColor),
                            ),
                            SizedBox(
                                width:
                                    Dimensions.getHorizontalPadding(context) *
                                        2),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Dimensions.getScreenWidth(context) *
                                        0.6,
                                    child: Text(
                                      posts.venueName ?? "",
                                      style:
                                          Fonts.getEventDetailsCompanyNameStyle(
                                                  context)
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                      height: Dimensions.getTileVerticalPadding(
                                          context)),
                                  Text(
                                    "${posts.venueCity!}, ${posts.venueCountry}",
                                    style:
                                        Fonts.getTileFooterTextStyle(context),
                                  )
                                ])
                          ])
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.getTileVerticalPadding(context)),
                    child: Text("About Event",
                        style:
                            Fonts.getEventDetailsAboutEventTextStyle(context)),
                  ),
                  Text(
                    posts.description!,
                    style: Fonts.getEventDetailsParaTextStyle(context),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  )
                ]),
          ),
          SizedBox(
            height: Dimensions.getScreenHeight(context) * 0.1,
          )
        ]),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Dimensions.getBookButtonHeight(context),
              width: Dimensions.getBookButtonWidth(context),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.indigoColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimensions.getTileRadius(context) * 2))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "BOOK NOW",
                            style: Fonts.getBookNowTextStyle(context),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColours.lightIndigoColorForTile,
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              Dimensions.getHorizontalPadding(context)),
                          child: const Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

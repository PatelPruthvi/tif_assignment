import 'package:flutter/material.dart';
import 'package:tif_assignment/features/events/ui/event_page.dart';
import 'package:tif_assignment/resources/fonts/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Internet Folks Assignment',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: false,
              color: Colors.transparent,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.black),
              actionsIconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: Fonts.getTitleTextStyle(context)),
        ),
        home: const EventScreen());
  }
}

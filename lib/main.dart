import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocityxapp2/travel/travel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(),
      theme: ThemeData(
        accentColor: Colors.red,
        primaryColor: Colors.cyan,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      // cardColor: Vx.white,
      // canvasColor: creamcolor,
      // primaryColor: darkbluish,
      // indicatorColor: darkcreamcolor,
      // hoverColor: darkbluish,
      // unselectedWidgetColor: Vx.white,
      cardColor: Vx.white,
      canvasColor: creamcolor,
      unselectedWidgetColor: darkbluish,
      primaryColor: darkbluish,
      indicatorColor: Colors.black,
      hoverColor: Vx.white,
      focusColor: Vx.yellow400,

      // thememode : ThemeData.dark(),
      fontFamily: GoogleFonts.inconsolata().fontFamily,
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          )));

  static Color creamcolor = const Color.fromARGB(255, 240, 240, 240);
  static Color darkcreamcolor = Vx.gray900;
  static Color darkbluish = const Color.fromARGB(255, 22, 15, 48);
  static Color lightbluish = Vx.indigo300;

  static ThemeData darktheme(BuildContext context) => ThemeData(
      // cardColor: Colors.black,
      // hoverColor: darkcreamcolor,
      // canvasColor: darkcreamcolor,
      // primaryColor: Vx.yellow400,
      // unselectedWidgetColor: Vx.white,
      // indicatorColor: Vx.white,
      cardColor: Colors.black,
      focusColor: darkbluish,
      canvasColor: darkcreamcolor,
      // For icons
      unselectedWidgetColor: Vx.yellow400,
      // for big fonts,like the title in homepage
      primaryColor: Vx.yellow400,
      // for normal small text,like fonts in cards
      indicatorColor: Vx.white,
      // hovercolor is same color,which is white,for fonts inside the icons
      hoverColor: Vx.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          )));
}

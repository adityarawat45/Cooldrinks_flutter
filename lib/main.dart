// ignore_for_file: camel_case_types, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/page/cart.dart';
import 'package:flutter_application_1/models/page/home_page.dart';
import 'package:flutter_application_1/models/page/login.dart';
import 'package:flutter_application_1/models/page/signup.dart';

import 'package:flutter_application_1/utilites/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const loginpage(),
        Routes.homeroute: (context) => const homePage(),
        Routes.loginroute: (context) => const loginpage(),
        Routes.signup: (context) => const signuppage(),
        Routes.cartroute: (context) => const cart(),
      },
    );
  }
}

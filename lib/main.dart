import 'package:cat_dog_clf/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatDog Classifier',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: SplashPage(),
    );
  }
}

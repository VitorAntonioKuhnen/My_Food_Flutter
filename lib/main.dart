import 'package:flutter/material.dart';
import 'package:my_food/homepage.dart';
import 'package:my_food/login.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(24, 233, 231, 100),
    appBarTheme: AppBarTheme(
          // backgroundColor: Color.fromARGB(0, 0, 0, 0),
          backgroundColor: Color.fromARGB(120, 44, 44, 44),
          toolbarHeight: 80,
        ),
    ),
  ),
  );
}

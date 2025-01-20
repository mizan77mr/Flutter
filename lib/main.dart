import 'package:flutter/material.dart';
import 'package:textfield/homepage.dart';
import 'package:textfield/homepage2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme:AppBarTheme(backgroundColor: Colors.amber) ,
        scaffoldBackgroundColor:Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        )
        )),

      home: Homepage2(),
    );
  }
}

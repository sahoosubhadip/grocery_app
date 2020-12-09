import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/Entry.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
      //Color(0xff029EB9)
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:Color(0xFFFFC400),
        fontFamily: 'OpenSens',
      ),
      debugShowCheckedModeBanner: false,
      home: Entry(),
    );
  }
}



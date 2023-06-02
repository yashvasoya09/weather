import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/provider/w%20provider.dart';
import 'package:weather/screen/view/dash_screen.dart';
import 'package:weather/screen/view/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => wProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => homeScreen(),
          'dashScreen':(context) => dashScreen(),
        },
      ),
    ),
  );
}

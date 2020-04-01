//importing the neccesary packages
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/utils/splash_screen.dart';

//defining entry point of the application
void main() => runApp(MyApp());
//root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
          create: (context) => Auth(),
          child: MaterialApp(
          title: 'Time Tracker',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false),
    );
  }
}
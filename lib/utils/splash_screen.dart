import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time_tracker_flutter_course/utils/navigators.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(opacity: 0.5, child: Image.asset('images/bg.png')),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      "Time \n Tracker",
                      style: TextStyle(
                          fontSize: 100.0,
                          fontFamily: 'DancingScript',
                          shadows: <Shadow>[
                            Shadow(
                                blurRadius: 18.0,
                                color: Colors.black87,
                                offset: Offset.fromDirection(120, 12))
                          ]),
                    ),
                    SizedBox(height: 200.0),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text('Time is what we want most, but what we use worst. \n',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('- Willam Penn',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

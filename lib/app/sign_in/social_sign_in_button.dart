import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          childs: Row(
            children: <Widget>[
              Image.asset(assetName, height: 100.0, width: 100.0),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}

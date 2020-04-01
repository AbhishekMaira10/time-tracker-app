import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_shape_clipper.dart';
import 'package:time_tracker_flutter_course/custom_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSigninError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(title: 'Sign in failed', exception: exception)
        .show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } on PlatformException catch (e) {
      _showSigninError(context, e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSigninError(context, e);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSigninError(context, e);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: _buildContainer(context),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 50.0, child: _buildHeader()),
                SizedBox(height: 150.0),
                Icon(
                  Icons.account_circle,
                  size: 30.0,
                ),
                SizedBox(height: 10.0),
                SocialSignInButton(
                  assetName: 'images/google-logo.png',
                  text: 'Sign in with Google',
                  textColor: Colors.black87,
                  color: Colors.white,
                  onPressed:
                      _isLoading ? null : () => _signInWithGoogle(context),
                ),
                SizedBox(height: 16.0),
                SocialSignInButton(
                  assetName: 'images/facebook-logo.png',
                  text: 'Sign in with Facebook',
                  textColor: Colors.white,
                  color: Color(0xFF334D92),
                  onPressed:
                      _isLoading ? null : () => _signInWithFacebook(context),
                ),
                SizedBox(height: 16.0),
                SignInButton(
                  text: 'Sign in with email',
                  textColor: Colors.white,
                  color: Colors.teal[700],
                  onPressed:
                      _isLoading ? null : () => _signInWithEmail(context),
                ),
                SizedBox(height: 10.0),
                Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                SignInButton(
                  text: 'Go Anonymous',
                  textColor: Colors.black54,
                  color: Colors.lime[600],
                  onPressed:
                      _isLoading ? null : () => _signInAnonymously(context),
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: CustomPageClipper(),
          child: Container(
            height: 250.0,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.indigo, Colors.blueAccent]),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            Center(
              child: Text('Sign In!!',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'DancingScript',
                    fontStyle: FontStyle.italic,
                  )),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SizedBox(height: 1.0);
    }
  }
}

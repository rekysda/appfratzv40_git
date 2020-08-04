import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PROFIL //
class Logout extends StatefulWidget {
  @override
  _Logout createState() => new _Logout();
}
enum LoginStatus { notSignIn, signIn }
class _Logout extends State {
    LoginStatus _loginStatus = LoginStatus.notSignIn;
  @override
  void initState() {
       super.initState();
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
            _loginStatus = LoginStatus.notSignIn;
    });
            Navigator.pushNamed(context, '/Login');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Logout"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                signOut();
              },
              child:
                  const Text('Click to Logout', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
// PROFIL //

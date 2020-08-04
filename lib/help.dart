import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// PROFIL //
class Help extends StatefulWidget {
  @override
  _Help createState() => new _Help();
}

class _Help extends State {


  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Help"),
        backgroundColor: Colors.blueAccent,
      ),
body: new Container(
        //adding padding around card
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             new Text("HELP"),    
          ]
        )
      )
    );
  }
}
// PROFIL //
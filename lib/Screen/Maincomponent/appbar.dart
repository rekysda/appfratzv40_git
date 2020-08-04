import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  
  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      title: Image.asset("assets/images/logofratz.png",height: 20.5,),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
          child: Center()
        )
      ],
    );
  }
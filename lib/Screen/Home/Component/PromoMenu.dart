import 'dart:ui';

import 'package:appfratzv40/Constant.dart';
import 'package:appfratzv40/Screen/Home/Component/GofoodMenu.dart';
//import 'package:appfratzv4/Screen/Home/Component/GopayMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoMenu extends StatelessWidget {
  const PromoMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17, bottom: 12),
      //height: 225,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          GofoodMenu(),
         
        ],
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  final String imgpath;
  final String iconpath;
  final String title;
  final String buttontext;
  final sizeicon;
  const PromoBanner({
    Key key,
    this.imgpath,
    this.iconpath,
    this.title,
    this.buttontext,
    this.sizeicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      height: 167,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter, 
      colors: [Colors.black.withOpacity(0.5), Colors.transparent,Colors.black.withOpacity(0.6), ],
    ),
  ),
),
          Positioned(
            top: 18,
            left: 16,
            child: SvgPicture.asset(
              iconpath,
              height: sizeicon,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 18,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                  color: Color(0xFF27A626),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                buttontext,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

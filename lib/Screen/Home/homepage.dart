import 'package:appfratzv40/Constant.dart';
import 'package:appfratzv40/Screen/Home/Component/PromoMenu.dart';
import 'package:appfratzv40/Screen/Home/Component/header.dart';
import 'package:appfratzv40/Screen/Maincomponent/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int curridx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Bgcolor,
        appBar: appbar(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 46,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                iconBtnAppbar("assets/icons/Home.svg", "Home", 0),
                iconBtnAppbar("assets/icons/MyAccount.svg", "Profile", 1),
                iconBtnAppbar("assets/icons/logout.svg", "Logout", 2),
            //    iconBtnAppbar("assets/icons/Help.svg", "FCM", 3),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Header(),
              PromoMenu(),
            ],
          ),
        ));
  }

  GestureDetector iconBtnAppbar(String iconpath, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          curridx = index;
        if (index == 1) {
        Navigator.pushNamed(context, '/Profil');
      }
      if (index == 2) {
        Navigator.pushReplacementNamed(context, '/Logout');
      }
      if (index == 3) {
        Navigator.pushNamed(context, '/FCM');
      }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            iconpath,
            height: 19,
            color: curridx == index ? GreenColor : BottomIcon,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 9,
                fontWeight:
                    curridx == index ? FontWeight.w700 : FontWeight.w600,
                color: curridx == index ? GreenColor : BottomIcon),
          )
        ],
      ),
    );
  }
}


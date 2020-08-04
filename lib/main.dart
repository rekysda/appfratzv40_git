import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appfratzv40/Screen/Home/homepage.dart';
import 'package:appfratzv40/theme.dart';
import 'package:appfratzv40/help.dart';
import 'package:appfratzv40/profil.dart';
import 'package:appfratzv40/logout.dart';
import 'package:appfratzv40/pengumuman.dart';
import 'package:appfratzv40/panduan.dart';
import 'package:appfratzv40/informasikeuangan.dart';
import 'package:appfratzv40/absensi.dart';
import 'package:appfratzv40/pelanggaran.dart';
import 'package:appfratzv40/fcm.dart';

import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(),
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      // When navigating to the "/second" route, build the SecondScreen widget.

      '/Login': (context) => Login(),
      '/Home': (context) => Home(),
      '/Help': (context) => Help(),
      '/Profil': (context) => Profil(),
      '/Logout': (context) => Logout(),
      '/Pengumuman': (context) => Pengumuman(),
      '/Panduan': (context) => Panduan(),
      '/InformasiKeuangan': (context) => InformasiKeuangan(),
      '/Absensi': (context) => Absensi(),
      '/Pelanggaran': (context) => Pelanggaran(),
      '/FCM': (context) => FCM(),
    },
  ));
}

var url_situs = "http://sisterv4.frateran.sch.id/sisterv4fratz/api/loginsiswa";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;

  final firebaseMessaging = FirebaseMessaging();
  String token = '';

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    /* format nis 17983 ; tanggallahir 0000-00-00 */
    /* http://192.168.8.21/sisterv4fratz/api/loginsiswa */
    /* http://sisterv4.frateran.sch.id/sisterv4fratz/api/loginsiswa */
    final response = await http.post(
        "http://sisterv4.frateran.sch.id/sisterv4fratz/api/loginsiswa",
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String nisAPI = data['nis'];
    String namaAPI = data['namasiswa'];
    String id = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, nisAPI, namaAPI, id, pesan);
      });
      debugPrint('token: $token');
        final response = await http.post(
        "http://sisterv4.frateran.sch.id/sisterv4fratz/api/insertdeviceidsiswa",
        body: {"nis": username, "deviceid": token});
      print("pesan : $pesan");
    } else {
      print("pesan : $pesan");
    }
  }

  savePref(
      int value, String nis, String nama, String id, String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("nis", nis);
      preferences.setString("id", id);
      preferences.setString("message", message);
      preferences.commit();
    });
  }

  var value;
  String message;
  String noinduk;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      message = preferences.getString("message");
      noinduk = preferences.getString("nis");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    firebaseMessaging.getToken().then((token) => setState(() {
          this.token = token;
        }));
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                Image.asset("assets/playstore.png"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Please insert Username";
                    }
                  },
                  onSaved: (e) => username = e,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: _secureText,
                  onSaved: (e) => password = e,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    check();
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return Home();
        // return MainMenu(signOut);
        break;
    }
  }
}

// class _RegisterState extends State<Register> {
class MainMenu extends StatefulWidget {
  final VoidCallback signOut;

  MainMenu(this.signOut);
  @override
  _MainMenuState createState() => _MainMenuState();
}

/****** CLASS MAIN MENU *********** */
class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  var value;
  String message;
  String noinduk;
  String namasiswa;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text(
      'Index 1: Business',
    ),
    Text(
      "Selamat Datang",
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushNamed(context, '/Home');
      }
      if (index == 1) {
        Navigator.pushNamed(context, '/Help');
      }
      if (index == 2) {
        Navigator.pushNamed(context, '/Profil');
      }
      if (index == 3) {
        signOut();
      }
    });
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

//  TabController tabController;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      //  nis = preferences.getString("nis");
      //  nama = preferences.getString("nama");
      value = preferences.getInt("value");
      message = preferences.getString("message");
      noinduk = preferences.getString("nis");
      namasiswa = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(); // default

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Dashboard"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                // Show a basic widget
                signOut();
              },
              icon: Icon(Icons.backspace),
            )
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Keuangan'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('Profil'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

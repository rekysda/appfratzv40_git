import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PROFIL //
class Absensi extends StatefulWidget {
  @override
  _Absensi createState() => new _Absensi();
}

class _Absensi extends State {
//  Map data;
  Map data;
  String noinduk;
  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    noinduk = preferences.getString("nis");
    http.Response response = await http.get(Uri.encodeFull(
        "http://sisterv4.frateran.sch.id/sisterv4fratz/api/siswapresensi?nis=$noinduk"));
    setState(() {
      data = json.decode(response.body);
    });
    print(data);
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Presensi Siswa"),
          backgroundColor: Colors.blueAccent,
        ),
      body: ListView.builder(
        itemCount: data == null ? 0 : 1,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            //      child: new Text(data[index]["nama"]),
            child: ListTile(
              title: Text(data["namasiswa"]), //BAGIAN TENGAH AKAN MENAMPIKAN NAMA TEMPAT WISATANYA
              subtitle: Text(
                "SAKIT"+" : " +data["sakit"]["jumlah"]+"\n"+
                "IJIN"+" : " +data["ijin"]["jumlah"]+"\n"+
                "ALPA"+" : " +data["alpa"]["jumlah"]+"\n"),
            ),
          );
        },
      ),
    );
  }
}
// PROFIL //

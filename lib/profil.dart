import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// PROFIL //
class Profil extends StatefulWidget {
  @override
  _Profil createState() => new _Profil();
}

class _Profil extends State {
//  Map data;

  List data;
  String noinduk;
  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    noinduk = preferences.getString("nis");
    http.Response response = await http.get(Uri.encodeFull(
        "http://sisterv4.frateran.sch.id/sisterv4fratz/api/siswadetail?nis=$noinduk"));
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
        title: new Text("Profil"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            //      child: new Text(data[index]["nama"]),
            child: ListTile(
              title: Text(data[index][
                  "namasiswa"]), //BAGIAN TENGAH AKAN MENAMPIKAN NAMA TEMPAT WISATANYA
              subtitle: Text("NIS" +
                  "\n" +
                  data[index]["nis"] +
                  "\n" +
                  "JENIS KELAMIN" +
                  "\n" +
                  data[index]["kelaminsiswa"] +
                  "\n" +
                  "ALAMAT" +
                  "\n" +
                  data[index]["alamatsiswa"] +
                  "\n" +
                  "SEKOLAH ASAL" +
                  "\n" +
                  data[index]["sekolahasal"] +
                  "\n"),
            ),
          );
        },
      ),
    );
  }
} // PROFIL //

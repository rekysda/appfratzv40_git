import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//pengumuman
class InformasiKeuangan extends StatefulWidget {
  @override
  _InformasiKeuangan createState() => new _InformasiKeuangan();
}

class _InformasiKeuangan extends State {
  List datakeuangan;
  String noinduk;
  String keterangan;
  Future<String> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    noinduk = preferences.getString("nis");
    http.Response response = await http.get(
        Uri.encodeFull(
            "http://sisterv4.frateran.sch.id/sisterv4fratz/api/siswakeuangan?nis=$noinduk"),
        headers: {"Accept": "application/json"});
    setState(() {
      datakeuangan = json.decode(response.body);
    });
    print(datakeuangan);
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Informasi Keuangan"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: datakeuangan == null ? 0 : datakeuangan.length,
          itemBuilder: (BuildContext context, int index) {
            if (datakeuangan[index]['is_paid'] == '1') {
              keterangan = "TERBAYAR";
            } else {
              keterangan = "BELUM TERBAYAR";
            }
            return new Card(
              child: ListTile(
                title: Text(datakeuangan[index][
                    'namasiswa']+" "+datakeuangan[index][
                    'biaya']), //BAGIAN TENGAH AKAN MENAMPIKAN NAMA TEMPAT WISATANYA
                subtitle: Text("RP " +
                    datakeuangan[index]['nominal'] +
                    " [ $keterangan ]"), //DIBAWAH TITLE AKAN MENAMPILKAN DESKRIPSI SINGKAT YANG DILIMIT HANYA 100 HURUF
              ),
            );
          },

          ///
        ),
//
      ),
    );
  }
}

//pengumuman

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//pengumuman
class Pengumuman extends StatefulWidget {
  @override
  _Pengumuman createState() => new _Pengumuman();
}

class _Pengumuman extends State {
  List data;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            "http://sisterv4.frateran.sch.id/sisterv4fratz/api/pengumuman"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pengumuman"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
      //      child: new Text(data[index]["nama"]),
      child: ListTile(
          title: Text(data[index]["created_at"]), //BAGIAN TENGAH AKAN MENAMPIKAN NAMA TEMPAT WISATANYA
          subtitle: Text(data[index]["nama"]), //DIBAWAH TITLE AKAN MENAMPILKAN DESKRIPSI SINGKAT YANG DILIMIT HANYA 100 HURUF
        ),
          );
        },
      ),
    );
  }
} 

//pengumuman
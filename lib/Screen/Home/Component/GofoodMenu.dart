import 'package:appfratzv40/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GofoodMenu extends StatelessWidget {
  const GofoodMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fasilitas Sekolah",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 142,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ImageScroll(imgpath: "assets/images/99.jpg", text: "Gedung",),
                ImageScroll(imgpath: "assets/images/02.jpg", text: "Taman Dalam",),
                ImageScroll(imgpath: "assets/images/03.jpg", text: "Taman Dalam",),
                ImageScroll(imgpath: "assets/images/04.jpg", text: "Kelas",),
                ImageScroll(imgpath: "assets/images/05.jpg", text: "Science Class",),
                ImageScroll(imgpath: "assets/images/06.jpg", text: "Bimbingan",),
                ImageScroll(imgpath: "assets/images/07.jpg", text: "Lab IPA",),
                ImageScroll(imgpath: "assets/images/08.jpg", text: "Lab Komputer",),
                ImageScroll(imgpath: "assets/images/09.jpg", text: "AULA",),
                ImageScroll(imgpath: "assets/images/10.jpg", text: "Tata Usaha",),
                ImageScroll(imgpath: "assets/images/11.jpg", text: "Perpustakaan",),
                ImageScroll(imgpath: "assets/images/12.jpg", text: "Kantin",),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageScroll extends StatelessWidget {
  final String imgpath;
  final text;
  const ImageScroll({
    Key key, this.imgpath, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:14),
      child: Column(
        children: <Widget>[
          Container(
            width: 123,
            height: 123,
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgpath),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(height:6),
          Text(text,style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 11),)
        ],
      ),
    );
  }
}

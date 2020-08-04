import 'package:flutter/material.dart';

class ServiceMenu extends StatelessWidget {
  const ServiceMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          // left: 16,
          // right: 16,
          top: 18,
        ),
        decoration: BoxDecoration(color: Colors.white),
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Wrap(
            spacing: 35,
            runSpacing: 20,
            children: <Widget>[
                            ServiceBtn(
                imgpath: "assets/images/panduan.png",
                text: "PANDUAN",
                press: () {
                  Navigator.pushNamed(context, '/Panduan');
                  },
              ),
              ServiceBtn(
                imgpath: "assets/images/pembayaran.png",
                text: "KEUANGAN", 
                press: () {
                  Navigator.pushNamed(context, '/InformasiKeuangan');
                  },
              ),
                            ServiceBtn(
                imgpath: "assets/images/absensi.png",
                text: "PRESENSI",
                press: () {
                  Navigator.pushNamed(context, '/Absensi');
                  },
              ),
              ServiceBtn(
                imgpath: "assets/images/pengumuman.png",
                text: "PENGUMUMAN",
                press: () {
                  Navigator.pushNamed(context, '/Pengumuman');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceBtn extends StatelessWidget {
  final String imgpath;
  final String text;
  final Function press;
  const ServiceBtn({
    Key key,
    this.imgpath,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[100], width: 1.5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(
              imgpath,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

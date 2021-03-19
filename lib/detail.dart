import 'package:flutter/material.dart';
import 'package:flutter_layout_app/detail_provider.dart';
import 'package:flutter_layout_app/home_provider.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailProvider(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  'assets/images/logo_celebritiesdotid.png',
                  scale: 16 / 4,
                ),
              ),
            ),
            leadingWidth: 130,
            actions: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Foto',
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  Provider.of<HomeProvider>(context).listData[0]['title'],
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Text(
                  'By Videla',
                  style: TextStyle(color: Colors.red[600]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Text('Rabu, 4 November 2020'),
              ),
              Image.asset(
                Provider.of<DetailProvider>(context).image,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Text('Foto: The Korea Herald'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Seoul – Boyband kpop BTS akan merilis versi baru dari album BE , yakni BE (Essential Edition). Pada 20 November 2020, BTS merilis BE (Deluxe Edition), sebuah album yang lahir dari pandemi Covid-19. Album ini menampilkan delapan lagu yang menghibur, termasuk Life Goes On, Fly to My Room, dan Dynamite. \n\nBaca juga: Wah! Ternyata Ini Kebiasaan Tidur Aneh Anggota BTS',
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeProvider>().setShow(true);
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ],
          ),
        );
      },
    );
  }
}

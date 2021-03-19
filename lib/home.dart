import 'package:flutter/material.dart';
import 'package:flutter_layout_app/home_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 3.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/logo_celebritiesdotid.png',
                scale: 20 / 9,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: InkWell(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Detail()));
            Get.toNamed('/detail');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Headline',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.red[600],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Image.asset('assets/images/foto_bts.png'),
              ),
              Text(
                'Entertaiment',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red[600]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  Provider.of<HomeProvider>(context).listData[0]['title'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: context.watch<HomeProvider>().isShow
                          ? Colors.blue
                          : Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

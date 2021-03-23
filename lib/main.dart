import 'package:flutter/material.dart';
import 'package:flutter_layout_app/home.dart';
import 'package:flutter_layout_app/controller/home_controller.dart';
import 'package:get/route_manager.dart';
import 'detail.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/detail', page: () => Detail())
      ],
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_layout_app/home.dart';
import 'package:flutter_layout_app/home_provider.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home()),
          GetPage(name: '/detail', page: () => Detail())
        ],
        home: Home(),
      ),
    );
  }
}

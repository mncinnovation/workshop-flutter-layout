import 'package:flutter/material.dart';
import 'package:flutter_layout_app/detail_controller.dart';
import 'package:flutter_layout_app/home_controller.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (detail) {
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
                  controller.pickTitle,
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
                controller.pickImage,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Text('Foto: The Korea Herald'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  detail.deskripsi,
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
                    controller.setShow(true);
                    detail.onBack();
                  },
                  child: Text('Back'))
            ],
          ),
        );
      },
    );
  }
}

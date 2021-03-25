import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_layout_app/detail.dart';
import 'package:flutter_layout_app/controller/home_controller.dart';
import 'package:flutter_layout_app/model/artikel_model.dart';
import 'package:flutter_layout_app/service/app_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditorController extends GetxController with AppService {
  Color colorText, colorBackground;
  // List<Map<String, String>> item = [
  //   {
  //     'image': 'assets/images/foto_tiara.png',
  //     'type': 'TV Star',
  //     'title':
  //         'Sentuhan Ala Drakor Bakal Warnai Perjalanan Cinta Arsy Widianto dan Tiara Andini',
  //     'time': '10 Menit lalu'
  //   },
  //   {
  //     'image': 'assets/images/foto_bts.png',
  //     'type': 'Entertaiment',
  //     'title': 'Siap-Siap, BTS Dikabarkan Akan Rilis Album BE versi Terbaru',
  //     'time': '50 Menit lalu'
  //   },
  //   {
  //     'image': 'assets/images/foto_rose.png',
  //     'type': 'Fit',
  //     'title': '4 Makanan Terbaik saat Anda Menjalani Isolasi Mandiri di Rumah',
  //     'time': '1 Menit lalu'
  //   },
  // ];

  List<Datum> item = ArtikelModel().data;

  HomeController home = Get.find<HomeController>();

  TextEditingController kommentar = TextEditingController();

  EditorController() {
    if (Get.isDarkMode) {
      colorText = Colors.black;
      colorBackground = Colors.white;
    } else {
      colorText = Colors.white;
      colorBackground = Colors.black;
    }
  }

  onTapItem(value) async {
    await home.setArtikel(value);
    Get.to(() => Detail());
  }

  // @override
  // void onInit() {
  //   item = home.listData;
  //   update();
  //   super.onInit();
  // }

  fetchCeleb() async {
    try {
      final result = await fetchArticle();
      item = result.data;
      update();
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}

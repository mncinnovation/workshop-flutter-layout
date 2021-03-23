import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_layout_app/detail.dart';
import 'package:flutter_layout_app/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditorController extends GetxController {
  Color colorText, colorBackground;
  List<Map<String, String>> item = [
    {
      'image': 'assets/images/foto_tiara.png',
      'type': 'TV Star',
      'title':
          'Sentuhan Ala Drakor Bakal Warnai Perjalanan Cinta Arsy Widianto dan Tiara Andini',
      'time': '10 Menit lalu'
    },
    {
      'image': 'assets/images/foto_bts.png',
      'type': 'Entertaiment',
      'title': 'Siap-Siap, BTS Dikabarkan Akan Rilis Album BE versi Terbaru',
      'time': '50 Menit lalu'
    },
    {
      'image': 'assets/images/foto_rose.png',
      'type': 'Fit',
      'title': '4 Makanan Terbaik saat Anda Menjalani Isolasi Mandiri di Rumah',
      'time': '1 Menit lalu'
    },
  ];

  HomeController home = Get.find<HomeController>();

  EditorController() {
    if (Get.isDarkMode) {
      colorText = Colors.black;
      colorBackground = Colors.white;
    } else {
      colorText = Colors.white;
      colorBackground = Colors.black;
    }
  }

  onTapItem(String images, String title) async {
    await home.setImage(images);
    await home.setTitle(title);
    Get.to(() => Detail());
  }
}

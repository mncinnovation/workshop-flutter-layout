import 'package:flutter/material.dart';
import 'package:flutter_layout_app/model/artikel_model.dart';
import 'package:flutter_layout_app/service/app_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with AppService {
  bool isShow = false;

  var listData = ArtikelModel().data;

  // var listData = [
  //   {
  //     'gambar': 'assets/images/foto_bts.png',
  //     'channel': 'Entertainment',
  //     'title': 'Siap-Siap, BTS Dikabarkan Akan Rilis Album BE versi Terbaru'
  //   },
  //   {
  //     'gambar': 'assets/images/foto_tiara.png',
  //     'channel': 'Music',
  //     'title':
  //         'Sentuhan ala Drakor Bakal Warnai Perjalanan Cinta Arsy Widianto dan Tiara Andini'
  //   },
  //   {
  //     'gambar': 'assets/images/foto_joe.png',
  //     'channel': 'Fashion & Beauty',
  //     'title': 'Penampilan Joe Taslim di Film Mortal Kombat'
  //   },
  //   {
  //     'gambar': 'assets/images/foto_drakor.png',
  //     'channel': 'Entertainment',
  //     'title':
  //         'Bong Joon Ho Ditunjuk Jadi Ketua Juri Festival Film Venesia 2021'
  //   },
  // ];

  var pickImage;
  var pickTitle;

  var page = 0;

  var isRead = true;

  Datum artikel = Datum();

  setShow(value) {
    isShow = value;

    update();
  }

  setPage(value) {
    page = value;
    update();
  }

  setRead(value) {
    isRead = value;
    update();
  }

  onTapItem(value) {
    artikel = value;
    update();
    Get.toNamed('/detail');
  }

  setArtikel(value) {
    artikel = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCeleb();
  }

  fetchCeleb() async {
    try {
      final result = await fetchArticle();
      listData = result.data;
      update();
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}

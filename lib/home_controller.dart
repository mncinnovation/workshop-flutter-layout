import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isShow = false;

  var listData = [
    {
      'gambar': 'assets/images/foto_bts.png',
      'channel': 'Entertainment',
      'title': 'Siap-Siap, BTS Dikabarkan Akan Rilis Album BE versi Terbaru'
    },
    {
      'gambar': 'assets/images/foto_tiara.png',
      'channel': 'Music',
      'title':
          'Sentuhan ala Drakor Bakal Warnai Perjalanan Cinta Arsy Widianto dan Tiara Andini'
    },
    {
      'gambar': 'assets/images/foto_joe.png',
      'channel': 'Fashion & Beauty',
      'title': 'Penampilan Joe Taslim di Film Mortal Kombat'
    },
    {
      'gambar': 'assets/images/foto_drakor.png',
      'channel': 'Entertainment',
      'title':
          'Bong Joon Ho Ditunjuk Jadi Ketua Juri Festival Film Venesia 2021'
    },
  ];

  var pickImage;
  var pickTitle;

  setShow(value) {
    isShow = value;

    update();
  }

  var page = 0;

  var isRead = true;

  setPage(value) {
    page = value;
    update();
  }

  setRead(value) {
    isRead = value;
    update();
  }

  onTapItem(String images, String title) {
    pickTitle = title;
    pickImage = images;
    update();
    Get.toNamed('/detail');
  }
}

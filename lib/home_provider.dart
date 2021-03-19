import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  bool isShow = false;

  var listData = [
    {
      'gambar': 'assets/img/foto_bts.png',
      'channel': 'Entertainment',
      'title': 'Siap-Siap, BTS Dikabarkan Akan Rilis Album BE versi Terbaru'
    },
    {
      'gambar': 'assets/img/foto_tiara.png',
      'channel': 'Music',
      'title':
          'Sentuhan ala Drakor Bakal Warnai Perjalanan Cinta Arsy Widianto dan Tiara Andini'
    },
    {
      'gambar': 'assets/img/foto_joe.png',
      'channel': 'Fashion & Beauty',
      'title': 'Penampilan Joe Taslim di Film Mortal Kombat'
    },
    {
      'gambar': 'assets/img/foto_drakor.png',
      'channel': 'Entertainment',
      'title':
          'Bong Joon Ho Ditunjuk Jadi Ketua Juri Festival Film Venesia 2021'
    },
  ];

  setShow(value) {
    isShow = value;

    notifyListeners();
  }
}

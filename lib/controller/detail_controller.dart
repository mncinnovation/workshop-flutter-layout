import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailController extends GetxController {
  var deskripsi =
      'Seoul – Boyband kpop BTS akan merilis versi baru dari album BE , yakni BE (Essential Edition). Pada 20 November 2020, BTS merilis BE (Deluxe Edition), sebuah album yang lahir dari pandemi Covid-19. Album ini menampilkan delapan lagu yang menghibur, termasuk Life Goes On, Fly to My Room, dan Dynamite. \n\nBaca juga: Wah! Ternyata Ini Kebiasaan Tidur Aneh Anggota BTS';
  TextEditingController textController = TextEditingController();
  bool isShowField = false;
  List<String> comment = [];

  static const KEY = 'KEYCOMMENT';

  postComment() {
    if (textController.text.isNotEmpty) {
      comment.add(textController.text);
      saveComment(comment);
      textController.text = '';
      showComment();
      update();
    }
  }

  showComment() {
    isShowField = !isShowField;
    update();
  }

  onBack() {
    Get.defaultDialog(
      title: 'Peringatan',
      middleText: 'Yakin anda ingin keluar dari halaman detail ?',
      onConfirm: () {
        Get.toNamed('/');

        Get.snackbar('Home', 'Selamat Datang Kembali');
      },
      onCancel: () {},
    );
  }

  saveComment(value) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setStringList(KEY, value);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  readComment() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final result = pref.getStringList(KEY);
      result.isNotEmpty ? comment = result : null;
      update();
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  void onInit() {
    readComment();
    super.onInit();
  }
}

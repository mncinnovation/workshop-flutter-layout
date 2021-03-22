import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailController extends GetxController {
  var deskripsi =
      'Seoul – Boyband kpop BTS akan merilis versi baru dari album BE , yakni BE (Essential Edition). Pada 20 November 2020, BTS merilis BE (Deluxe Edition), sebuah album yang lahir dari pandemi Covid-19. Album ini menampilkan delapan lagu yang menghibur, termasuk Life Goes On, Fly to My Room, dan Dynamite. \n\nBaca juga: Wah! Ternyata Ini Kebiasaan Tidur Aneh Anggota BTS';

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
}

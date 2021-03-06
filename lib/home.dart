import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_app/editor_choice.dart';
import 'package:flutter_layout_app/controller/home_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  var textTitle = 'Headline'.obs;
  // HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) => Get.find<HomeController>().fetchCeleb(),
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 3.0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/logo_celebritiesdotid.png',
                    scale: 20 / 9,
                  ),
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      textTitle.value,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.red[600],
              ),
              Container(
                height: 400,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      if (controller.listData != null) {
                        return CarouselSlider.builder(
                          itemCount: controller.listData == null
                              ? 0
                              : controller.listData.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return InkWell(
                              onTap: () => controller
                                  .onTapItem(controller.listData[index]),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                    child: Image.network(controller
                                            .listData[index]?.thumbLarge ??
                                        ''),
                                  ),
                                  Text(
                                    controller.listData[index]?.tipe,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.red[600]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      controller.listData[index]?.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: controller.isRead
                                              ? Colors.black
                                              : Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayAnimationDuration: Duration(seconds: 1),
                              autoPlayInterval: Duration(seconds: 3),
                              initialPage: controller.page,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              height: 100,
                              onPageChanged: (index, _) {
                                controller.setPage(index);
                              }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.listData == null
                        ? 0
                        : controller.listData.length,
                    (index) => Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red[600]),
                        shape: BoxShape.rectangle,
                        color: controller.page == index
                            ? Colors.red[600]
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              EditorChoice(),
            ],
          ),
        );
      },
    );
  }
}

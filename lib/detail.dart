import 'package:flutter/material.dart';
import 'package:flutter_layout_app/controller/detail_controller.dart';
import 'package:flutter_layout_app/controller/home_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
                  controller.artikel.title,
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
              Image.network(
                controller.artikel.thumbLarge,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Text('Foto: The Korea Herald'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  controller.artikel.description,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (detail.comment.isNotEmpty)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'komentar',
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: detail.comment.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.person_sharp),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    detail.comment[index],
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: detail.isShowField,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8.0),
                    child: TextFormField(
                      controller: detail.textController,
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => detail.postComment(),
                            child: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !detail.isShowField,
                child: InkWell(
                  onTap: () => detail.showComment(),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black,
                    ),
                    child: Text(
                      'isi komentar',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
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

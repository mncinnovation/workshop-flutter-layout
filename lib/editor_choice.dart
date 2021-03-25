import 'package:flutter/material.dart';
import 'package:flutter_layout_app/controller/editor_controller.dart';
import 'package:get/get.dart';

class EditorChoice extends StatelessWidget {
  const EditorChoice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(
      init: EditorController(),
      builder: (controller) {
        return Container(
          color: controller.colorBackground,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Editor's CHoice",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                            color: controller.colorText),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 3.0,
                          color: Colors.red[600],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: GetBuilder<EditorController>(
                  init: EditorController(),
                  initState: (value) =>
                      Get.find<EditorController>().fetchCeleb(),
                  builder: (controller) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.item?.length ?? 0,
                    itemBuilder: (context, index) {
                      return itemContent(controller, index);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget itemContent(EditorController controller, int index) {
    return GestureDetector(
      onTap: () => controller.onTapItem(
        controller.item[index],
      ),
      child: Container(
        width: MediaQuery.of(Get.context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              controller.item[index].thumbLarge,
              scale: 20 / 9,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                controller.item[index].tipe,
                style: TextStyle(color: Colors.red[600], fontSize: 15.0),
              ),
            ),
            Text(
              controller.item[index].title,
              style: TextStyle(color: controller.colorText, fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                controller.item[index].datePublish,
                style: TextStyle(
                    color: controller.colorText, fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

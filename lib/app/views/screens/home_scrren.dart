import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/app/utils/colors.dart';
import 'package:test_getx/base/controllers/app_controller.dart';

class HomeScreen extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GetColors.mainColor,
      ),
      body: ListView.builder(
        itemCount: controller.audios.length,
        itemBuilder: (context, i) {
          Audio audio = controller.audios[i];
          return GestureDetector(
            onTap: () {},
            child: ListTile(
                selectedTileColor: Colors.red,
                title: Obx(() => Text(controller.realAudio.value != i
                    ? audio.path
                    : "Playing : ${audio.path}")),
                subtitle: Obx(
                  () => Text(controller.status.toString()),
                )),
          );
        },
      ),
    );
  }
}
/*
Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              controller.back(4);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: ()async{
              await controller.stop();
            },
            icon: Icon(Icons.stop),
          ),
          IconButton(
            onPressed: (){
              controller.next(4);
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
      body:
    );
  }
 */

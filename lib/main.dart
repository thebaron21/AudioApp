import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/views/screens/home_scrren.dart';
import 'app/utils/list_auios.dart';
import 'base/controllers/app_controller.dart';
import 'app/models/Audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ِشرح أصول السنة للإمام احمد إبن حنبل',
      home: HomeScreen(),
    );
  }
}

// class PlayView extends GetView<AppController> {
//   final controller = Get.put(AppController());
//   var objX = AudioServiceList()..listPath();
//
//   @override
//   Widget build(BuildContext context) {
//     return
// }

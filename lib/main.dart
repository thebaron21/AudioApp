import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/views/screens/home_screen.dart';
import 'app/utils/config.dart';
import 'base/bindings/home.dart';
import 'base/pages/about_app.dart';
import 'base/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: BaseHomeBindings(),
      title:AppConfig.appName,
      debugShowCheckedModeBanner: false,
      getPages: [
        BaseHomePage(),
        BaseAboutApp()
      ],
    );
  }
}
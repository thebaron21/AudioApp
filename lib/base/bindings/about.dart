
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_getx/base/controllers/base_about_controller.dart';

class BaseAboutBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BaseAboutController());
  }
}
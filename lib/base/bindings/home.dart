
import 'package:get/get.dart';
import 'package:test_getx/base/controllers/base_controller.dart';

class BaseHomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
  }


}
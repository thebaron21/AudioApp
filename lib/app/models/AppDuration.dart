import 'package:test_getx/base/models/BaseDuration.dart';

class AppDuration{

  static String duration(Duration time) {
    return " ${time.inMinutes}:${time.inSeconds%60} ";
  }

}
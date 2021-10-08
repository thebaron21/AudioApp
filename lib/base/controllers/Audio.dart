import 'package:test_getx/base/services/Audio.dart';

abstract class BaseAudio extends AudioService{
  BaseAudio() : super();

  int stop();
  int start(String file);
  int resume();
  bool loop();
  void moveTimeLine(int time);
  void moveVolume({double volume = 1.0});
  durationLine();
  timePosition();
}
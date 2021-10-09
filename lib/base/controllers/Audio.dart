import 'package:test_getx/base/services/Audio.dart';

abstract class BaseAudio{

  Future<int> stop();
  Future<int> start(String file);
  Future<int> resume();
  Future<int> pause();
  Future<bool> loop();
  Future<bool> notLoop();
  void moveTimeLine(int time);
  void moveVolume({double volume = 1.0});
  Stream<Duration> durationLine();
  Stream<Duration> timePosition();
}
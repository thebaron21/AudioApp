
abstract class Control{
  play(int index);
  pause();
  stop();
  resume();
  next(int index);
  back(int index);
  loop();
  moveTime(int time);
}